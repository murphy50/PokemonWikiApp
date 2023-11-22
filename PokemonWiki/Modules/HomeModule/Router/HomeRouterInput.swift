//
//  HomeRouterInput.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

protocol HomeRouterInput: AnyObject {
    var presenter: HomeRouterOutput! { get }
}
