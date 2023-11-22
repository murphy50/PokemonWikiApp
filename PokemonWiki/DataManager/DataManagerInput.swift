//
//  DataManagerInput.swift
//  PokemonWiki
//
//  Created by murphy on 21.11.2023.
//

import Foundation

protocol DataManagerInput: AnyObject {
    func obtainPokemonList() async throws -> [Pokemon]
}
