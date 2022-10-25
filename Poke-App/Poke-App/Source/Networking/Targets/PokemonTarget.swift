//
//  PokemonTarget.swift
//  Poke-App
//
//  Created by Roberto De la O Pocasangre on 24/10/22.
//

import Foundation
import Moya

enum PokemonTarget{
    case fetchPokemonList
}

extension PokemonTarget: TargetType {
    var path: String {
        switch self {
        case .fetchPokemonList: return "pokemon"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchPokemonList: return .get
        }
    }
    
    var task: Task {
        .requestPlain
    }
}
