//
//  DataManager.swift
//  PokemonWiki
//
//  Created by murphy on 21.11.2023.
//

import Foundation


enum FetchingSource: Equatable {
    case localeStorage(isAlreadyFetched: Bool)
    case network
}

class DataManagerImpl: DataManager {
    
    var source: FetchingSource = .network
    
    func obtainPokemonImageData(_ pokemon: Pokemon) async throws -> Data? {
        if let result = try? await networkService.downloadImageData(from: pokemon.imageURL) {
            return result
        } else {
            let pokemon = try localStorageService.findOrCreate(pokemon: pokemon, image: nil)
            return pokemon.image
        }
    }
    
    func obtainPokemonList() async -> [Pokemon] {
        if let pokemonArray = try? await obtainFromNetwork() {
            source = .network
            saveToLocalStorage(pokemonArray)
            return pokemonArray
        }
        if source == .localeStorage(isAlreadyFetched: false) || source == .network {
            if let pokemonArray = try? await obtainFromStorage() {
                source = .localeStorage(isAlreadyFetched: true)
                return pokemonArray
            }
        }
        return []
    }
    
    private let networkService: NetworkServiceImpl = NetworkServiceImpl()
    private let localStorageService = LocalStorageService.shared
}

private extension DataManagerImpl {
    func convertertingNetworkModel(_ pokemonRaw: PokemonNetworkModel) throws -> Pokemon {
        let url = pokemonRaw.sprites.other.officialArtwork.frontDefault
        let types = pokemonRaw.types.map { PokemonType(rawValue: $0.type.name) ?? .normal }
        return Pokemon(
            id: pokemonRaw.id,
            name: pokemonRaw.name,
            imageURL: url,
            types: types,
            weight: pokemonRaw.weight,
            height: pokemonRaw.height
        )
    }
    
    func convertertingStorageModel(_ pokemonEntity: PokemonEntity) throws -> Pokemon {
        let typesString = pokemonEntity.types.components(separatedBy: ",")
        let types = typesString.map { PokemonType(rawValue: $0) ?? PokemonType.normal }
        return Pokemon(
            id: Int(pokemonEntity.id),
            name: pokemonEntity.name,
            imageURL: pokemonEntity.imageURL,
            types: types,
            weight: Int(pokemonEntity.weight),
            height: Int(pokemonEntity.height)
        )
    }
    
    func obtainFromNetwork() async throws -> [Pokemon] {
        let pokemonURLModels = try await networkService.fetchPokemonURL()
        var pokemonArray = [Pokemon]()
        for pokemonRawInfo in pokemonURLModels {
            guard let pokemonRaw = try? await networkService.fetchPokemonData(with: pokemonRawInfo.url) else { continue }
            guard let pokemon = try? convertertingNetworkModel(pokemonRaw) else { continue }
            pokemonArray.append(pokemon)
        }
        return pokemonArray
    }
    
    func saveToLocalStorage(_ pokemonArray: [Pokemon]) {
        Task { [pokemonArray] in
            for pokemon in pokemonArray {
                let isExist = try? localStorageService.isExist(pokemon: pokemon)
                if let isExist = isExist, isExist != true {
                    let image = try await networkService.downloadImageData(from: pokemon.imageURL)
                    _ = try localStorageService.findOrCreate(pokemon: pokemon, image: image)
                }
            }
            localStorageService.saveContext()
        }
    }
    
    func obtainFromStorage() async throws -> [Pokemon] {
        var pokemonArray = [Pokemon]()
        let pokemonEntities = (try? await localStorageService.getAll()) ?? []
        for pokemonEntity in pokemonEntities {
            guard let pokemon = try? convertertingStorageModel(pokemonEntity) else { continue }
            pokemonArray.append(pokemon)
        }
        return pokemonArray
    }
}
