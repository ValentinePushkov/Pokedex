//
//  LocalPokemonFetcher.swift
//  Pokedex
//
//  Created by Valson on 20.03.23.
//

import Foundation
import RealmSwift

final class LocalPokemonFetcher: ObservableObject{
    @Published var localPokemons: [LocalPokemon] = []
    @Published var dataIsLoaded: Bool = false
    
    lazy var realm = try! Realm()
    
    func save(pokemon: Pokemon){
        realm.beginWrite()
        let localPokemon = LocalPokemon()
        localPokemon.name = pokemon.name
        if localPokemons.doesNotContain(localPokemon){
            realm.add(localPokemon)
        }
        try! realm.commitWrite()
    }
    
    func saveAndRender(localPokemonFetcher: LocalPokemonFetcher, pokemonFetcher: PokemonFetcher){
        if !pokemonFetcher.dataIsSaved{
            for pokemon in pokemonFetcher.pokemons{
                print(pokemon.name)
                localPokemonFetcher.save(pokemon: pokemon)
            }
            pokemonFetcher.dataIsSaved = true
        }
    }
    
    func render(){
        let pokemons = try! realm.objects(LocalPokemon.self)
        self.localPokemons = pokemons.compactMap({(pokemon) -> LocalPokemon in
            return pokemon
        })
        self.dataIsLoaded = true
    }
    
    func deleteAllPokemons(){
        let result = realm.objects(LocalPokemon.self)
        try! realm.write{
            realm.delete(result)
        }
    }
    
    func deletePokemon(pokemon: LocalPokemon){
        try! realm.write{
            realm.delete(pokemon)
        }
    }
}



extension Array where Element: Equatable {
    func doesNotContain(_ element: Element) -> Bool {
        return !contains(element)
    }
}
