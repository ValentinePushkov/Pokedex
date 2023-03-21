//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var pokemonFetcher = PokemonFetcher()
    @StateObject var localPokemonFetcher = LocalPokemonFetcher()
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView{
                if pokemonFetcher.dataIsLoaded{
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(pokemonFetcher.pokemons) { pokemon in
                            NavigationLink(
                                destination: PokemonDetailView(pokemon: pokemon),
                                label: {
                                    PokemonRowView(pokemon: pokemon)
                                })
                        }.padding(.top, 20)
                    }
                    .navigationTitle("Pokedex")
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear(perform: {
                        localPokemonFetcher.saveAndRender(localPokemonFetcher: localPokemonFetcher, pokemonFetcher: pokemonFetcher)
                    })
                }
            }
        }
        .environmentObject(pokemonFetcher)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
