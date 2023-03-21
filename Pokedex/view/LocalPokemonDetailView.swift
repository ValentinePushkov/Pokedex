//
//  LocalPokemonDetailVIew.swift
//  Pokedex
//
//  Created by Valson on 20.03.23.
//

import SwiftUI

struct LocalPokemonDetailView: View {
    let pokemon: LocalPokemon
    var body: some View {
        VStack{
            LocalPokemonRowView(pokemon: pokemon)
        }
    }
}

struct LocalPokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocalPokemonDetailView(pokemon: LocalPokemon(value: "Pokemon"))
    }
}
