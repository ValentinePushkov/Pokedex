//
//  APIMockService.swift
//  Pokedex
//
//  Created by Valson on 19.03.23.
//

import Foundation

struct APIMockService: APIServiceProtocol{
    var result: Result<[Pokemon], APIError>
    func fetchPokemons(url: URL?, completion: @escaping(Result<[Pokemon], APIError>) -> Void){
        completion(result)
    }
}
