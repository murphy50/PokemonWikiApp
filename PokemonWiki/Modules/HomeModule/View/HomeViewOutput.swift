//
//  HomeViewOutput.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

protocol HomeViewOutput: AnyObject {
    func showPokemonDetail(for pokemon: Pokemon)
    func loadMorePokemon()
    var view: HomeViewInput! { get }
    var pokemonArray: [Pokemon] { get }
}
