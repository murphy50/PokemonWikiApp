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
        let interactor = HomeInteractor()
        let rounter = HomeRouter()
        
        view.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.rounter = rounter
        
        interactor.output = presenter
        
        return view
        
    }
}
