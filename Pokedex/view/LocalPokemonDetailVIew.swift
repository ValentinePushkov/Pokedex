//
//  LocalPokemonDetailVIew.swift
//  Pokedex
//
//  Created by Valson on 20.03.23.
//

import SwiftUI

struct LocalPokemonDetailVIew: View {
    let pokemon: LocalPokemon
    var body: some View {
        VStack{
            LocalPokemonRowView(pokemon: pokemon)
        }
    }
}

struct LocalPokemonDetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        LocalPokemonDetailVIew(pokemon: LocalPokemon(value: "Pokemon"))
    }
}
