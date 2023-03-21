//
//  APIServiceProtocol.swift
//  Pokedex
//
//  Created by Valson on 19.03.23.
//

import Foundation

protocol APIServiceProtocol {
    func fetchPokemons(url: URL?, completion: @escaping(Result<[Pokemon], APIError>) -> Void)
    func fetchPokemonDetails(url: URL?, completion: @escaping(Result<PokemonDetail, APIError>) -> Void)
}

