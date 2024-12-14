//
//  DataView.swift
//  ResultAPIFragmentApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct DataView: View {
    @State private var textInput: String = ""
    @ObservedObject var viewModel: ShareViewModel
    @Binding var isBottomSheetPresented: Bool
    
    var body: some View {
        VStack {
            TextField("Enter some text", text: $textInput)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                viewModel.setText(textInput)
                isBottomSheetPresented.toggle()
            }) {
                Text("Open Bottom Sheet")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
