//
//  HomeModuleTests.swift
//  PokemonWikiTests
//
//  Created by murphy on 27.11.2023.
//

import XCTest
@testable import PokemonWiki

class MockDataManager: DataManager {
    func obtainPokemonList() async throws -> [PokemonWiki.Pokemon] {
        return [Pokemon(id: 1234, name: "bulbasaur", imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/100.png", types: [.bug, .fire], weight: 234, height: 134)]
    }
    
    func obtainPokemonImageData(_ pokemon: PokemonWiki.Pokemon) async throws -> Data? {
        nil
    }
    
    var source: PokemonWiki.FetchingSource = .network
}

class MockView: HomeViewInput {
    func showPokemon() {
    }
    
    var output: PokemonWiki.HomeViewOutput!
    
}

final class HomeModuleTests: XCTestCase {

    var presenter: HomePresenter!
    var interactor: HomeInteractor!
    var view: HomeViewInput!
    var router: HomeRouter!
    
    override func setUpWithError() throws {
        
        presenter = HomePresenter()
        interactor = HomeInteractor()
        view = MockView()
        router = HomeRouter()
        
        let dataManager = MockDataManager()
        interactor.dataManager = dataManager
        interactor.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.view = view as? UIViewController
        
        view.output = presenter
        
    }

    override func tearDownWithError() throws {
        presenter = nil
        interactor = nil
        view = nil
        router = nil
    }

    func testModuleIsNotNil() {
        XCTAssertNotNil(view)
        XCTAssertNotNil(presenter)
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(router)
    }
    
    func testObtainingData() async {

        try? await interactor.obtainPokemonList()
        XCTAssertEqual(presenter.pokemonArray.count, 1)
        XCTAssertEqual(presenter.source, .network)
        XCTAssertNotNil(presenter.pokemonArray.first!)
    }
}
