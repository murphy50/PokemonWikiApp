//
//  NetworkService.swift
//  PokemonWiki
//
//  Created by murphy on 20.11.2023.
//

import Foundation

protocol NetworkServiceInput {
    func networkDataFetcher() async throws -> [Result]
    func pokemonDataFetcher(with url: String) async throws -> PokemonNetwork
    func downloadImageData(from url: String) async throws -> Data 
}
