//
//  DetailScreenDetailScreenViewInput.swift
//  PokemonWiki
//
//  Created by murphy50 on 23/11/2023.
//  Copyright © 2023 a. All rights reserved.
//

protocol DetailScreenViewInput: AnyObject {
    func showEntity()
    var output: DetailScreenViewOutput! { get set }
}
