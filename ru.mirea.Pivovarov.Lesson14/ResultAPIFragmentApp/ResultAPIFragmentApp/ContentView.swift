//
//  ContentView.swift
//  ResultAPIFragmentApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ShareViewModel()
    @State private var isBottomSheetPresented = false
    
    var body: some View {
        VStack {
            DataView(viewModel: viewModel, isBottomSheetPresented: $isBottomSheetPresented)
                .padding()
        }
        .sheet(isPresented: $isBottomSheetPresented) {
            BottomSheetView(viewModel: viewModel, isPresented: $isBottomSheetPresented)
        }
    }
}

#Preview {
    ContentView()
}
