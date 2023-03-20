//
//  PokemonFetcher.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import Foundation

class PokemonFetcher: ObservableObject{
    
    @Published var pokemons = [Pokemon]()
    @Published var pokemonDetails: PokemonDetail?
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    @Published var dataIsLoaded: Bool = false
    @Published var dataIsSaved: Bool = false
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()){
        self.service = service
        fetchAllPokemons()
    }
    
    func fetchAllPokemons(){
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151")
        service.fetchPokemons(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let pokemons):
                    print("--- sucess with \(pokemons.count)")
                    self.pokemons = pokemons
                    self.dataIsLoaded = true
                }
            }
        }
        
    }
    
    func getPokemonID(pokemon: Pokemon)->Int{
        if let index = self.pokemons.firstIndex(of: pokemon){
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon:Pokemon){
        self.pokemonDetails = PokemonDetail(id: 0, name: "nope", height: 0, weight: 0)
        isLoading = true
        errorMessage = nil

        let url = URL(string: pokemon.url)
        let service = APIService()
        service.fetchPokemonDetails(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let pokemonDeatails):
                    print("--- sucess with \(pokemonDeatails.weight)")
                    self.pokemonDetails = pokemonDeatails
                    self.dataIsLoaded = true
                }
            }
        }
    }
    
}
