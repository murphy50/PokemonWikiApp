//
//  HomePresenter.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

class HomePresenter: HomeViewOutput, HomeInteractorOutput, HomeRouterOutput {
    
    
    
    var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    var pokemonArray: [Pokemon]  = []
    
    func checkCorrectness() {
        
        print(Set(pokemonArray.map { $0.name }).count == pokemonArray.count)
        
    }
    
    func showPokemonDetail(for pokemon: Pokemon) {
        
        
    }
    
    func loadMorePokemon() {
         interactor.loadMorePokemon()
        
    }
    
    func didFinishObtainingPokemon(_ pokemon: [Pokemon]) {
        self.pokemonArray += pokemon
        checkCorrectness()
        view.showPokemon()
    }
    
}
