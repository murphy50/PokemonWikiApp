//
//  HomePresenter.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

class HomePresenter: HomeViewOutput, HomeInteractorOutput {
    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var rounter: HomeRouterInput!
}
