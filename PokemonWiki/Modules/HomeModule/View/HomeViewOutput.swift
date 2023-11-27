//
//  HomeViewOutput.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

protocol HomeViewOutput: AnyObject {
    func didPressedCell(with index: Int)
    func loadMorePokemon()
    var view: HomeViewInput! { get }
    var pokemonArray: [Pokemon] { get }
    var source: FetchingSource { get }
}
