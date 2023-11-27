//
//  HomePresenter.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

class HomePresenter: HomeViewOutput, HomeInteractorOutput {

    
    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    var pokemonArray: [Pokemon]  = []
    
    var source: FetchingSource = .network
    func didPressedCell(with index: Int) {
        router.showDetailScree(with: pokemonArray[index])
    }
    
    func checkCorrectness() {
        
        print(Set(pokemonArray.map { $0.name }).count == pokemonArray.count)
        
    }
    
    func loadMorePokemon() {
         interactor.loadMorePokemon()
        
    }
    
    func didFinishObtainingPokemon(_ pokemon: [Pokemon], from source: FetchingSource) {
        self.source = source
        self.pokemonArray += pokemon
        checkCorrectness()
        view.showPokemon()
    }
}
