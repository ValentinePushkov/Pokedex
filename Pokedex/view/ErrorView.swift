//
//  ErrorView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var vm: PokemonFetcher
    var body: some View {
        VStack {
                
                Text("😿")
                    .font(.system(size: 80))
                
                Text(vm.errorMessage ?? "")
                
                Button {
                    vm.fetchAllPokemons()
                } label: {
                    Text("Try again")
                }

                
            }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(vm: PokemonFetcher())
    }
}
