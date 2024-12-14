//
//  ContentView.swift
//  BottomNavigationApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NotesViewModel()
    
    var body: some View {
        TabView {
            NavigationStack {
                ListNoteView()
                    .environmentObject(viewModel)
            }
            .tabItem {
                Label("Notes", systemImage: "note.text")
            }
            NavigationStack {
                AddNoteView()
                    .environmentObject(viewModel)
            }
            .tabItem {
                Label("Add Note", systemImage: "plus.circle")
            }
            NavigationStack {
                AboutView()
            }
            .tabItem {
                Label("About", systemImage: "info.circle")
            }
        }
    }
}

#Preview {
    ContentView()
}
