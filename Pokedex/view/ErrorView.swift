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
        VStack {
                
                Text("😿")
                    .font(.system(size: 80))
                
                Text(pokemonFetcher.errorMessage ?? "")
                
                /*Button {
                    pokemonFetcher.fetchAllBreeds()
                } label: {
                    Text("Try again")
                }*/

                
            }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(pokemonFetcher: PokemonFetcher())
    }
}
