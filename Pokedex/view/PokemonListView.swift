//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var vm = PokemonFetcher()
    @StateObject var localPokemonFetcher = LocalPokemonFetcher()
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView{
                if vm.dataIsLoaded{
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(vm.pokemons) { pokemon in
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
                        if !vm.dataIsSaved{
                            for pokemon in vm.pokemons{
                                print(pokemon.name)

                                localPokemonFetcher.save(pokemon: pokemon)
                            }
                            vm.dataIsSaved = true
                        }
                        localPokemonFetcher.render()
                        for pokemon in localPokemonFetcher.localPokemons{
                            print(pokemon.name)
                        }
                        
                    })
                }
            }
        }
        .environmentObject(vm)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
