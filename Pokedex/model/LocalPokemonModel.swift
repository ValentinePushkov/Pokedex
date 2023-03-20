//
//  LocalPokemonModel.swift
//  Pokedex
//
//  Created by Valson on 20.03.23.
//

import Foundation
import RealmSwift

class LocalPokemon: Object, Identifiable{
    @objc dynamic var name: String = ""
}
