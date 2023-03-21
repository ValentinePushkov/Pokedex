//
//  LocalPokemonListView.swift
//  Pokedex
//
//  Created by Valson on 20.03.23.
//

import SwiftUI

struct LocalPokemonListView: View {
    @StateObject var pokemonFetcher = PokemonFetcher()
    @StateObject var localPokemonFetcher = LocalPokemonFetcher()
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView {
            VStack{
                Button {
                    pokemonFetcher.fetchAllPokemons()
                } label: {
                    Text("Go online")
                }
                .padding(.top, 20)
                
                ScrollView{
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(localPokemonFetcher.localPokemons) { pokemon in
                            NavigationLink(
                                destination: LocalPokemonDetailVIew(pokemon: pokemon),
                                label: {
                                    LocalPokemonRowView(pokemon: pokemon)
                                })
                        }.padding(.top, 20)
                    }
                    .navigationTitle("Offline Pokedex")
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear(perform: {
                        localPokemonFetcher.render()
                    })
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct LocalPokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        LocalPokemonListView()
    }
}
