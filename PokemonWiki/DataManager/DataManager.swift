//
//  DataManagerInput.swift
//  PokemonWiki
//
//  Created by murphy on 21.11.2023.
//

import Foundation

protocol DataManager: AnyObject {
    func obtainPokemonList() async throws -> [Pokemon]
    func obtainPokemonImageData(_ pokemon: Pokemon) async throws -> Data?
    var source: FetchingSource { get }
}
