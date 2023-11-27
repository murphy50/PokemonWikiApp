//
//  PokemonNetworkModel.swift
//  PokemonWiki
//
//  Created by murphy on 20.11.2023.
//

import Foundation

// MARK: - PokemonNetworkModel
struct GeneralNetworkModel: Codable {
    let count: Int
    let next: String?
    let pokeomonURLS : [PokemonURLModel]
    
    enum CodingKeys: String, CodingKey {
        case count, next
        case pokeomonURLS = "results"
    }
}

// MARK: - Result
struct PokemonURLModel: Codable {
    let name: String
    let url: String
}
