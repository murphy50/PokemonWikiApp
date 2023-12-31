//
//  HomeAssembly.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import UIKit

class HomeAssembly {
    
    class func configuredModule() -> UIViewController {
        
        let view = HomeViewController()

        let presenter = HomePresenter()
        let dataManager = DataManagerImpl()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        router.view = view
        view.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.configured()
        interactor.output = presenter
        interactor.dataManager = dataManager
        
        return view
        
    }
}
