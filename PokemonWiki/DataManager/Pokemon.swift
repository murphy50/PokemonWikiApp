//
//  Pokemon.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import UIKit

struct Pokemon {
    let name: String
    let image: Data?
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
//        switch self {
//        case .normal:
//            return UIColor(resource: .normal)
//        case .fighting:
//            return UIColor(resource: .fighting)
//        case .flying:
//            return self.rawValue
//        case .poison:
//            return
//        case .ground:
//            return
//        case .rock:
//            return
//        case .bug:
//            return
//        case .ghost:
//            return
//        case .steel:
//            return
//        case .fire:
//            return
//        case .water:
//            return
//        case .grass:
//            return
//        case .electric:
//            return
//        case .psychic:
//            return
//        case .ice:
//            return
//        case .dragon:
//            return
//        case .dark:
//            return
//        case .fairy:
//            return
//        case .unknown:
//            return
//        case .shadow:
//            return
//        }
    }
}
