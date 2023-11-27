//
//  DetailScreenDetailScreenInteractor.swift
//  PokemonWiki
//
//  Created by murphy50 on 23/11/2023.
//  Copyright © 2023 a. All rights reserved.
//

class DetailScreenInteractor: DetailScreenInteractorInput {

    weak var output: DetailScreenInteractorOutput!
    var dataManager: DataManagerInput!

    func configured(with pokemon: Pokemon) {
        Task {
            try await converting(pokemon: pokemon)
        }
    }
    
    @MainActor
    func converting(pokemon: Pokemon) async throws  {
        let image = try await dataManager.obtainPokemonImageData(pokemon)
        let entity = DetailScreenEntity(
                        name: pokemon.name,
                        image: image,
                        types: pokemon.types,
                        weight: pokemon.weight,
                        height: pokemon.height
        )
        output.didFinishConvertingEntity(entity)
    }
}
