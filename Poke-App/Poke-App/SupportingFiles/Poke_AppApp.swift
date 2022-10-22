//
//  Poke_AppApp.swift
//  Poke-App
//
//  Created by Roberto De la O Pocasangre on 22/10/22.
//

import SwiftUI

@main
struct Poke_AppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeCoordinator().view()
            }
        }
    }
}
