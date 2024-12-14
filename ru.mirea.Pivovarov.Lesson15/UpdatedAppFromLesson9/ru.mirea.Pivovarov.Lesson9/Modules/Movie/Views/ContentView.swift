//
//  ContentView.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    @State private var asyncImageId = UUID()
    
    var body: some View {
        LoginView()
            .environmentObject(viewModel)
            .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
                TodoView()
                    .environmentObject(viewModel)
            }
    }
}

#Preview {
    ContentView()
}
