//
//  NetworkService.swift
//  PokemonWiki
//
//  Created by murphy on 20.11.2023.
//

import Foundation

protocol NetworkServiceInput {
    func fetchPokemonURL() async throws -> [PokemonURLModel]
    func fetchPokemonData(with url: String) async throws -> PokemonNetworkModel
    func downloadImageData(from url: String) async throws -> Data 
}
