//
//  HomeScreenInteractor.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

class HomeInteractor: HomeInteractorInput {
    
    weak var output: HomeInteractorOutput!
    
    var dataManager: DataManagerInput!
    
    func configured() {
        loadMorePokemon()
    }
    
    func loadMorePokemon() {
        Task { try await obtainPokemonList() }
    }
    
    @MainActor
    func obtainPokemonList() async throws {
        let pokemonArray = try await dataManager.obtainPokemonList()
        output.didFinishObtainingPokemon(pokemonArray, from: dataManager.source)
    }
}
