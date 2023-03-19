//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI
import SBPAsyncImage

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @EnvironmentObject var vm: PokemonFetcher
    var body: some View {
        LazyVStack{
            if vm.dataIsLoaded{
                BackportAsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonID(pokemon: pokemon)).png"))
                          .frame(width: 200, height: 200)
                Text(pokemon.url)
                Text(vm.pokemonDetails!.name)
            }
        }.onAppear(perform: {
            self.vm.getDetails(pokemon: pokemon)
            
        })
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon(name: "", url:"")).environmentObject(PokemonFetcher())
    }
}
