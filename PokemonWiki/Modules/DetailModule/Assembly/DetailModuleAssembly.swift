//
//  DetailScreenDetailScreenConfigurator.swift
//  PokemonWiki
//
//  Created by murphy50 on 23/11/2023.
//  Copyright © 2023 a. All rights reserved.
//

import UIKit

class DetailModuleAssembly {

    static func configureModule(with pokemon: Pokemon) -> UIViewController {

        let router = DetailScreenRouter()
        let view = DetailScreenViewController()
        let presenter = DetailScreenPresenter()
        let interactor = DetailScreenInteractor()
        let dataManager = DataManagerImpl()
        
        interactor.dataManager = dataManager
        interactor.output = presenter
        interactor.configured(with: pokemon)
        
        view.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }

}
