//
//  DataManager.swift
//  PokemonWiki
//
//  Created by murphy on 21.11.2023.
//

import Foundation

class DataManager: DataManagerInput {
    
    
    
    let networkService: NetworkServiceInput
    let localStorageService = LocalStorageService.shared
    
    
    
    init() {
        self.networkService = NetworkService()
    }
    
    func networkModelConverter(_ pokemonRaw: PokemonNetwork) async throws -> Pokemon {
        let url = pokemonRaw.sprites.other.officialArtwork.frontDefault
        let imageData = try await networkService.downloadImageData(from: url)
        let types = pokemonRaw.types.map { PokemonType(rawValue: $0.type.name) ?? .normal }
        return Pokemon(
            name: pokemonRaw.name,
            image: imageData,
            types: types,
            weight: pokemonRaw.weight,
            height: pokemonRaw.height
        )
    }
    func storageModelConverter(_ pokemonEntity: PokemonEntity) async throws -> Pokemon {
        
        let typesString = pokemonEntity.types?.components(separatedBy: ",") ?? []
        let types = typesString.map { PokemonType(rawValue: $0) ?? PokemonType.normal }
        
        return Pokemon(
            name: pokemonEntity.name ?? "Unknown",
            image: pokemonEntity.image,
            types: types,
            weight: Int(pokemonEntity.weight),
            height: Int(pokemonEntity.height)
        )
    }
    
    private var isAlreadyFetchedFromStorage = false
    
    func obtainPokemonList() async -> [Pokemon] {
        
        var pokemonArray: [Pokemon] = []
        if let result = try? await networkService.networkDataFetcher() {
            for pokemonRawInfo in result {
                guard let pokemonRaw = try? await networkService.pokemonDataFetcher(with: pokemonRawInfo.url) else { continue }
                guard let pokemon = try? await networkModelConverter(pokemonRaw) else { continue }
                pokemonArray.append(pokemon)
            }
            print("network count \(pokemonArray.count)")
            Task { [pokemonArray] in
                try? await localStorageService.saveAll(pokemonArray: pokemonArray)
            }
        } else {
            if isAlreadyFetchedFromStorage { return [] }
            let pokemonEntities = (try? await localStorageService.getAllPokemonEntities()) ?? []
            for pokemonEntity in pokemonEntities {
                guard let pokemon = try? await storageModelConverter(pokemonEntity) else { continue }
                pokemonArray.append(pokemon)
            }
            isAlreadyFetchedFromStorage = true
        }
        return pokemonArray
        
    }
}
