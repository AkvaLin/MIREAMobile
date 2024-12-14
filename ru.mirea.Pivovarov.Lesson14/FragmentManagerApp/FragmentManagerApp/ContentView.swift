//
//  ContentView.swift
//  FragmentManagerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationSplitView {
            CountryListView()
                .environmentObject(viewModel)
        } detail: {
            CountryDetailView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    ContentView()
}
