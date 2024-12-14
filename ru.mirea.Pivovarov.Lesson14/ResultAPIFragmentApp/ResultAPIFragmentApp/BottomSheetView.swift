//
//  BottomSheetView.swift
//  ResultAPIFragmentApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//


import SwiftUI

struct BottomSheetView: View {
    @ObservedObject var viewModel: ShareViewModel
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("Received text: \(viewModel.selectedText)")
                .padding()
            
            Button(action: {
                isPresented = false
            }) {
                Text("Close")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
