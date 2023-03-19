//
//  LoadingView.swift
//  Pokedex
//
//  Created by Valson on 18.03.23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            Text("🦖")
                .font(.system(size: 40))
            ProgressView()
            Text("Getting the pokemons ...")
                .foregroundColor(.gray)
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
