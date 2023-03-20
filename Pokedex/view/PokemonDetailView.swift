//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI
import SBPAsyncImage

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @EnvironmentObject var vm: PokemonFetcher
    var body: some View {
        LazyVStack{
            if vm.dataIsLoaded{
                PokemonRowView(pokemon: pokemon)
                
                VStack(spacing: 10){
                    Text("ID: \(vm.pokemonDetails?.id ?? 0)")
                        .font(.system(size: 16, weight: .regular, design: .monospaced))
                        .padding(.bottom, 20)
                        .foregroundColor(.blue)
                    Text("Weight: \(( vm.pokemonDetails?.weight ?? 0)) KG")
                        .font(.system(size: 16, weight: .regular, design: .monospaced))
                        .padding(.bottom, 20)
                        .foregroundColor(.blue)
                    Text("Height: \((vm.pokemonDetails?.height ?? 0)) M")
                        .font(.system(size: 16, weight: .regular, design: .monospaced))
                        .padding(.bottom, 20)
                        .foregroundColor(.blue)
                    HStack{
                        Text("Type:")
                            .font(.system(size: 16, weight: .regular, design: .monospaced))
                            .padding(.bottom, 20)
                            .foregroundColor(.blue)
                        ForEach(vm.pokemonDetails?.types ?? [PokemonType.example()]){ type in
                            Text("\(type.type.name)")
                                .font(.system(size: 16, weight: .regular, design: .monospaced))
                                .padding(.bottom, 20)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }.onAppear(perform: {
            self.vm.getDetails(pokemon: pokemon)
        })
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon(name: "", url:"") ).environmentObject(PokemonFetcher())
    }
}
