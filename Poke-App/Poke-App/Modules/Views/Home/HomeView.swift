//
//  HomeView.swift
//  Poke-App
//
//  Created by Roberto De la O Pocasangre on 22/10/22.
//

import SwiftUI
import Stinsen

struct HomeView: View {
    @EnvironmentObject var coordinator: HomeCoordinator.Router
    @StateObject var viewModel = HomeViewModel(dependencies: HomeViewModelDependency())
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.pokemonList, id: \.self) { item in
                    Text(item.name)
                }
            }
        }.onAppear(perform: viewModel.fetchPokemonList)
    }
}
