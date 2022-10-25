//
//  HomeViewModel.swift
//  Poke-App
//
//  Created by Roberto De la O Pocasangre on 24/10/22.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    typealias Dependencies = HasHomeServiceType
    
    @Published var pokemonList: [Pokemon] = []
    private let dependencies: Dependencies
    
    private var cancellables = Set<AnyCancellable>()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func fetchPokemonList() {
        dependencies
            .homeService
            .fetchPokemonList()
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    print("SUCCESS")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] value in
                self?.pokemonList = value.results
            }.store(in: &cancellables)
    }
}

struct HomeViewModelDependency: HasHomeServiceType {
    let homeService: HomeServiceType = HomeService(router: Router())
}
