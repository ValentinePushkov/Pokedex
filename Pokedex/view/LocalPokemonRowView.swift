//
//  LocalPokemonRowView.swift
//  Pokedex
//
//  Created by Valson on 20.03.23.
//

import SwiftUI

struct LocalPokemonRowView: View {
    let pokemon: LocalPokemon
    var body: some View {
        VStack {
            Image("pokeball")
                .resizable()
                .scaledToFit()
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 20, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
                .foregroundColor(.blue)
        }
    }
}

struct LocalPokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        LocalPokemonRowView(pokemon: LocalPokemon(value: "Pokemon"))
    }
}
