//
//  api.swift
//  PokemonWiki
//
//  Created by murphy on 19.11.2023.
//

import Foundation

private enum NetworkServiceError: Error {
    case InvalidURL
    case InvalidHTTPResponse
    case InvalidHTTPStatusCode(statusCode: Int)
}

class NetworkService: NetworkServiceInput {
   
    
    
    private var session = URLSession.shared
    private var offset = 0
    private var limit = 20
    private lazy var urlPath = "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit)"
    
    
    func networkDataFetcher() async throws -> [Result] {
        guard let url = URL(string: urlPath) else { throw NetworkServiceError.InvalidURL }

        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkServiceError.InvalidHTTPResponse
        }
        guard response.statusCode == 200 else {
            throw NetworkServiceError.InvalidHTTPStatusCode(statusCode: response.statusCode)
        }
        let decoder = JSONDecoder()
        let res = try decoder.decode(NetworkModel.self, from: data)
        if let next = res.next {
            urlPath = next
        }
        return res.results
    }
    
    func pokemonDataFetcher(with url: String) async throws -> PokemonNetwork  {
        guard let url = URL(string: url) else { throw NetworkServiceError.InvalidURL }
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkServiceError.InvalidHTTPResponse
        }
        guard response.statusCode == 200 else {
            throw NetworkServiceError.InvalidHTTPStatusCode(statusCode: response.statusCode)
        }
        let decoder = JSONDecoder()
        let rawPokemon = try decoder.decode(PokemonNetwork.self, from: data)
        return rawPokemon
        
    }
    
    func downloadImageData(from url: String) async throws -> Data {
        guard let url = URL(string: url) else { throw NetworkServiceError.InvalidURL }
        
        let (data, response) = try await session.data(from: url)
        guard let response = response as? HTTPURLResponse else {
            throw NetworkServiceError.InvalidHTTPResponse
        }
        guard response.statusCode == 200 else {
            throw NetworkServiceError.InvalidHTTPStatusCode(statusCode: response.statusCode)
        }
        return data
    }
 
}
