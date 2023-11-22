//
//  PokemonNetworkModel.swift
//  PokemonWiki
//
//  Created by murphy on 20.11.2023.
//

import Foundation

// MARK: - PokemonNetworkModel
struct NetworkModel: Codable {
    let count: Int
    let next: String?
    //let previous: String?
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let url: String
}
