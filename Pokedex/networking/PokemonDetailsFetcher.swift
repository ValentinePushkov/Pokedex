//
//  PokemonDetailsFetcher.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import Foundation

class PokemonDetailsFetcher: ObservableObject{
    @Published var pokemonDetails: PokemonDetail? = nil
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    /*var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        fetchPokemonDetails(url: pokemon.url)
    }*/
    
    func fetchPokemonDetails(url: String){
        isLoading = true
               errorMessage = nil
               
               let url = URL(string: url)
               let service = APIService()
               service.fetchPokemonDetails(url: url) { [unowned self] result in
                   DispatchQueue.main.async {
                       self.isLoading = false
                       switch result {
                       case .failure(let error):
                           self.errorMessage = error.localizedDescription
                           // print(error.description)
                           print(error)
                       case .success(let pokemons):
                        print("--- sucess with \(pokemons.weight)")
                        self.pokemonDetails = pokemons
                        print(pokemonDetails!.height)
                       }
                   }
               }
    }
}
