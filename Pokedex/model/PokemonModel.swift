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
    var types: [PokemonType]
    static func example() -> PokemonDetail {
        return PokemonDetail(id: 1, name: "bulbasaur",
                             height: 7, weight: 69, types: [PokemonType.example()])
    }
}

struct PokemonType:Codable{
    var slot: Int
    var type: PokemonTypeDetails
    
  
    static func example() -> PokemonType {
        return PokemonType(slot: 1, type: PokemonTypeDetails.example())
    }
        
}

struct PokemonTypeDetails:Codable{
    var name: String
    
    static func example() -> PokemonTypeDetails {
        return PokemonTypeDetails(name: "stone")
    }
}

extension PokemonType: Identifiable{
    var id: Int{
        slot
    }
}

