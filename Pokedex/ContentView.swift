//
//  ContentView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokemonFetcher = PokemonFetcher()
    var body: some View {
        if pokemonFetcher.isLoading{
            LoadingView()
        }else if pokemonFetcher.errorMessage != nil{
            ErrorView(pokemonFetcher: pokemonFetcher)
        }else{
            PokemonListView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
