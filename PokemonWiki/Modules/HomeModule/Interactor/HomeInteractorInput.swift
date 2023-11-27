//
//  HomeInteractorInput.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

protocol HomeInteractorInput: AnyObject {
    func obtainPokemonList() async throws 
    func loadMorePokemon()
    var dataManager: DataManager! { get }
    var output: HomeInteractorOutput! { get }
}
