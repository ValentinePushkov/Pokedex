//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var vm = PokemonFetcher()
    private let adaptiveColumns = [
            GridItem(.adaptive(minimum: 150))
        ]
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.pokemons) { pokemon in
                        NavigationLink(
                            destination: PokemonDetailView(pokemon: pokemon),
                            label: {
                                PokemonRowView(pokemon: pokemon)
                            })
                    }.padding(.top, 20)
                   }
                   //.listStyle(PlainListStyle())
                .navigationTitle("Pokedex")
                .navigationBarTitleDisplayMode(.inline)
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
