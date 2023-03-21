//
//  APIMockService.swift
//  Pokedex
//
//  Created by Valson on 19.03.23.
//

import Foundation

struct APIMockService: APIServiceProtocol{
    var pokemonResult: Result<[Pokemon], APIError>?
    var pokemonDetailsResult: Result<PokemonDetail, APIError>?
    
    init(_ result: Result<[Pokemon], APIError>){
        self.pokemonResult = result
    }
    
    init(_ result: Result<PokemonDetail, APIError>){
        self.pokemonDetailsResult = result
    }
    
    func fetchPokemons(url: URL?, completion: @escaping(Result<[Pokemon], APIError>) -> Void){
        completion(pokemonResult!)
    }
    
    func fetchPokemonDetails(url: URL?, completion: @escaping(Result<PokemonDetail, APIError>) -> Void){
        completion(pokemonDetailsResult!)
    }
}
