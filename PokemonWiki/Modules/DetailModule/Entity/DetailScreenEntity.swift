//
//  DetailScreenEntity.swift
//  PokemonWiki
//
//  Created by murphy on 26.11.2023.
//

import Foundation

class DetailScreenEntity {
    let name: String
    let image: Data?
    let types: [PokemonType]
    let weight: Int
    let height: Int
    
    init(name: String, image: Data?, types: [PokemonType], weight: Int, height: Int) {
        self.name = name
        self.image = image
        self.types = types
        self.weight = weight
        self.height = height
    }
}
