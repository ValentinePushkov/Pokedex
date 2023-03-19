//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import Foundation

struct PokemonPage: Codable{
    var results: [Pokemon]
}

struct Pokemon: Codable,Identifiable, Equatable{
    let id = UUID()
    var name: String
    var url: String
    
    static func example() -> Pokemon {
            return Pokemon(name: "bulbasaur",
                          url: "https://pokeapi.co/api/v2/pokemon-form/1/")
    }
}

struct PokemonDetail: Codable, Identifiable{
    let id:Int
    var name: String
    var height: Int
    var weight: Int
}


