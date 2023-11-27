//
//  PokemonRaw.swift
//  PokemonWiki
//
//  Created by murphy on 21.11.2023.
//

import UIKit

struct PokemonNetworkModel: Codable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [TypeElement]
    let weight: Int
    let height: Int
}

class Sprites: Codable {
    let other: Other
}

struct Other: Codable {
    let officialArtwork: OfficialArtwork
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    let frontDefault: String
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct TypeElement: Codable {
    let slot: Int
    let type: Species
}

struct Species: Codable {
    let name: String
    let url: String
}
