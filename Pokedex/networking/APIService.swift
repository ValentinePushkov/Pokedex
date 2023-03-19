//
//  APIService.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import Foundation

struct APIService: APIServiceProtocol{

    func fetchPokemons(url: URL?, completion: @escaping(Result<[Pokemon], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let pokemons = try decoder.decode(PokemonPage.self, from: data)
                    completion(Result.success(pokemons.results))
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
                
                
            }
        }

        task.resume()
        
    }
    
    func fetchPokemonDetails(url: URL?, completion: @escaping(Result<PokemonDetail, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let pokemons = try decoder.decode(PokemonDetail.self, from: data)
                    completion(Result.success(pokemons))
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
                
                
            }
        }
        task.resume()
    }
}
