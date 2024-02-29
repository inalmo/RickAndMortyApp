//
//  ContentView.swift
//  RickMortyApp
//
//  Created by Iñigo Alonso Molledo on 16/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = NavigationBarModel()
 
    
    var body: some View {
        HomeView(viewModel: HomeViewModel())
            .environmentObject(model)
    }
}

#Preview {
    ContentView()
}

