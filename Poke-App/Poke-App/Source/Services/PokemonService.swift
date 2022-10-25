//
//  PokemonService.swift
//  Poke-App
//
//  Created by Roberto De la O Pocasangre on 24/10/22.
//

import Combine
import Foundation

protocol HomeServiceType {
    func fetchPokemonList() -> AnyPublisher<ApiResponse<[Pokemon]>, Error>
}

struct HomeService: HomeServiceType {
    let router: RouterType
    func fetchPokemonList() -> AnyPublisher<ApiResponse<[Pokemon]>, Error> {
        router
            .request(target: PokemonTarget.fetchPokemonList)
            .eraseToAnyPublisher()
    }
}

protocol HasHomeServiceType {
    var homeService: HomeServiceType { get }
}
