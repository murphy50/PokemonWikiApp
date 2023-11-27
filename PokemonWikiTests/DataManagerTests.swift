//
//  DataManagerTests.swift
//  PokemonWikiTests
//
//  Created by murphy on 27.11.2023.
//

import XCTest
@testable import PokemonWiki


class MockNetworkService: NetworkService {
    func fetchPokemonURL() async throws -> [PokemonWiki.PokemonURLModel] {
        let filePath = Bundle.main.path(forResource: "MockJSON", ofType: "json")!
        let fileUrl = URL(fileURLWithPath: filePath)
        let jsonData = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        let res = try decoder.decode(GeneralNetworkModel.self, from: jsonData)
        return res.pokeomonURLS
    }
    
    func fetchPokemonData(with url: String) async throws -> PokemonWiki.PokemonNetworkModel {
        let filePath = Bundle.main.path(forResource: "PokemonJSON", ofType: "json")!
        let fileUrl = URL(fileURLWithPath: filePath)
        let jsonData = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        let rawPokemon = try decoder.decode(PokemonNetworkModel.self, from: jsonData)
        return rawPokemon
    }
    
    func downloadImageData(from url: String) async throws -> Data {
        return Data()
    }
}
extension Pokemon: Equatable {
    public static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        if lhs.name == rhs.name && lhs.id == rhs.id && lhs.imageURL == rhs.imageURL
            && lhs.height == rhs.height && lhs.weight == rhs.weight && lhs.types == rhs.types {
            return true
        }
        return false
    }
}
final class DataManagerTests: XCTestCase {

    var dataManager: DataManager!
    var mokPokemon: Pokemon!
    
    override func setUpWithError() throws {
        dataManager = DataManagerImpl()
        mokPokemon = Pokemon(id: 1, name: "bulbasaur", imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png", types: [PokemonWiki.PokemonType.grass, PokemonWiki.PokemonType.poison], weight: 69, height: 7)
    }

    override func tearDownWithError() throws {
        dataManager = nil
    }
    
    func testObtainPokemonList() async {
        let pokemonArray = try? await dataManager.obtainPokemonList()
        let pokemon = Pokemon(id: 1, name: "bulbasaur", imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png", types: [PokemonWiki.PokemonType.grass, PokemonWiki.PokemonType.poison], weight: 69, height: 7)
        
        XCTAssertEqual(mokPokemon, pokemonArray![0])
        XCTAssertEqual(pokemonArray?.count,  10)
    }
    
    func testObtainImage() async {
        var notNilRes = try? await dataManager.obtainPokemonImageData(mokPokemon)
        XCTAssertNotNil(notNilRes)
    }
}
