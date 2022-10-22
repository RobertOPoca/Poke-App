//
//  HomeCoordinator.swift
//  Poke-App
//
//  Created by Roberto De la O Pocasangre on 22/10/22.
//

import Stinsen
import SwiftUI

final class HomeCoordinator: NavigationCoordinatable {
    @Root var start = makeStart
    let stack = NavigationStack(initial: \HomeCoordinator.start)
    
    @ViewBuilder
    func makeStart() -> some View {
        HomeView()
    }
}
