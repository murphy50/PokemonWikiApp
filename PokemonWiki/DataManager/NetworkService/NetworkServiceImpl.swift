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

class NetworkServiceImpl: NetworkService {
    
    private let session = URLSession.shared
    private var urlPath = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=10"
    
    func fetchPokemonURL() async throws -> [PokemonURLModel] {
        guard let url = URL(string: urlPath) else { throw NetworkServiceError.InvalidURL }
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkServiceError.InvalidHTTPResponse
        }
        guard response.statusCode == 200 else {
            throw NetworkServiceError.InvalidHTTPStatusCode(statusCode: response.statusCode)
        }
        let decoder = JSONDecoder()
        let res = try decoder.decode(GeneralNetworkModel.self, from: data)
        if let next = res.next {
            urlPath = next
        }
        return res.pokeomonURLS
    }
    
    func fetchPokemonData(with url: String) async throws -> PokemonNetworkModel  {
        guard let url = URL(string: url) else { throw NetworkServiceError.InvalidURL }
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkServiceError.InvalidHTTPResponse
        }
        guard response.statusCode == 200 else {
            throw NetworkServiceError.InvalidHTTPStatusCode(statusCode: response.statusCode)
        }
        let decoder = JSONDecoder()
        let rawPokemon = try decoder.decode(PokemonNetworkModel.self, from: data)
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
