//
//  HomeRouter.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//
import UIKit
import Foundation

class HomeRouter: HomeRouterInput {
    weak var view: UIViewController!
    func showDetailScree(with pokemon: Pokemon) {
       
        let vc = DetailModuleAssembly.configureModule(with: pokemon)
        
        view.present(vc, animated: true)
        
    }
}
            
