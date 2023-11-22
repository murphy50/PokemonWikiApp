//
//  HomeScreenInteractorOutput.swift.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

protocol HomeInteractorOutput: AnyObject {
    func didFinishObtainingPokemon(_ pokemon: [Pokemon])
    var interactor: HomeInteractorInput! { get }
}
