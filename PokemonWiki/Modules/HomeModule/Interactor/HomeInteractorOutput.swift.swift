//
//  HomeScreenInteractorOutput.swift.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

protocol HomeInteractorOutput: AnyObject {
    func didFinishObtainingPokemon(_ pokemon: [Pokemon], from source: FetchingSource)
    var interactor: HomeInteractorInput! { get }
}
