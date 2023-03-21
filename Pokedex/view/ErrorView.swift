//
//  ErrorView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var pokemonFetcher: PokemonFetcher
    var body: some View {
        NavigationView{
            VStack {
                    
                    Text("❌")
                        .font(.system(size: 80))
                    
                    Text(pokemonFetcher.errorMessage ?? "")
                HStack{
                    Button {
                        pokemonFetcher.fetchAllPokemons()
                    } label: {
                        Text("Try again")
                    }
                    
                    NavigationLink(destination: LocalPokemonListView(),
                    label: {
                        Text("Go Offline").padding()
                    })
                }
   
                }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(pokemonFetcher: PokemonFetcher())
    }
}
