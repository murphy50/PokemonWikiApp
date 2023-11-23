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
        let view = DetailScreenViewController(pokemon: pokemon)
        let presenter = DetailScreenPresenter()
        let interactor = DetailScreenInteractor()
        
        
        interactor.output = presenter
        view.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }

}
