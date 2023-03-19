//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI
import SBPAsyncImage

struct PokemonRowView: View {
    @EnvironmentObject var vm: PokemonFetcher
       let pokemon: Pokemon
       let dimensions: CGFloat = 140
        var body: some View {
        VStack {
            BackportAsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonID(pokemon: pokemon)).png")) { image in
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: dimensions, height: dimensions)
                        }
                    } placeholder: {
                        ProgressView()
                            .frame(width: dimensions, height: dimensions)
                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 10)
                    
                    Text("\(pokemon.name.capitalized)")
                        .font(.system(size: 16, weight: .regular, design: .monospaced))
                        .padding(.bottom, 20)
                }
            }
    }


struct PokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRowView(pokemon: Pokemon(name: "", url:"")).environmentObject(PokemonFetcher())
    }
}
