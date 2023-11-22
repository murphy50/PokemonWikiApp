//
//  HomeViewInput.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

protocol HomeViewInput: AnyObject {
    func showPokemon()
    var presenter: HomeRouterOutput! { get }
}
