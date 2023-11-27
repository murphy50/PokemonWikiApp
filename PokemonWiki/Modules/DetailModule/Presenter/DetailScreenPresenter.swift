//
//  DetailScreenDetailScreenPresenter.swift
//  PokemonWiki
//
//  Created by murphy50 on 23/11/2023.
//  Copyright © 2023 a. All rights reserved.
//

class DetailScreenPresenter: DetailScreenViewOutput, DetailScreenInteractorOutput {

    weak var view: DetailScreenViewInput!
    var interactor: DetailScreenInteractorInput!
    var router: DetailScreenRouterInput!
    var entity: DetailScreenEntity?
    
    func didFinishConvertingEntity(_ entity: DetailScreenEntity) {
        self.entity = entity
        view.showEntity()
    }
}
