//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var vm = PokemonFetcher()
    var body: some View {
        NavigationView {
                   List {
                    ForEach(vm.pokemons) { pokemon in
                        NavigationLink(
                            destination: PokemonDetailView(pokemon: pokemon),
                            label: {
                                Text(pokemon.name)
                            })
                       }
                   }
                   .listStyle(PlainListStyle())
        }
        .environmentObject(vm)
  }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
