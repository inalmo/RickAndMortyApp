//
//  RickMortyAppApp.swift
//  RickMortyApp
//
//  Created by Iñigo Alonso Molledo on 16/2/24.
//

import SwiftUI

@main
struct RickAndMortyAppApp: App {
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navStack) {
                ContentView()
            }.environmentObject(router)
        }
    }
}
