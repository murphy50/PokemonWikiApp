//
//  Pokemon.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import UIKit

struct Pokemon {
    let id: Int
    let name: String
    let imageURL: String
    let types: [PokemonType]
    let weight: Int
    let height: Int
}

enum PokemonType: String {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    case unknown
    case shadow
    
    func color() -> UIColor {
        UIColor(named: self.rawValue) ?? UIColor(resource: .normal)
    }
}
