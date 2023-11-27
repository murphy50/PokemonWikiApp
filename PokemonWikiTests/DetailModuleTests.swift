//
//  DetailModuleTests.swift
//  PokemonWikiTests
//
//  Created by murphy on 27.11.2023.
//

import XCTest
@testable import PokemonWiki


class MockDetailScreenView: DetailScreenViewInput {
    var output: PokemonWiki.DetailScreenViewOutput!
    
    func showEntity() {
        
    }
}
final class DetailModuleTests: XCTestCase {
    
    var presenter: DetailScreenPresenter!
    var interactor: DetailScreenInteractor!
    var view: DetailScreenViewInput!
    var router: DetailScreenRouter!
    
    override func setUpWithError() throws {
        
        presenter = DetailScreenPresenter()
        interactor = DetailScreenInteractor()
        view = MockDetailScreenView()
        router = DetailScreenRouter()
        
        let dataManager = MockDataManager()
        interactor.dataManager = dataManager
        interactor.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
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
        let pokemon = try? await interactor.dataManager.obtainPokemonList().first!
        try? await interactor.converting(pokemon: pokemon!)
        XCTAssertNil(presenter.entity?.image)
        XCTAssertNotNil(presenter.entity)
        XCTAssertEqual(presenter.entity?.name, "bulbasaur")
        XCTAssertEqual(presenter.entity?.types, [.bug, .fire])
        XCTAssertEqual(presenter.entity?.weight, 234)
        XCTAssertEqual(presenter.entity?.height, 134)
    }
}
