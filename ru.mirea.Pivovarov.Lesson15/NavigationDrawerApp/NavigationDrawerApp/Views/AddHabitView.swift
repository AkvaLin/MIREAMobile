//
//  AddHabitView.swift
//  NavigationDrawerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct AddHabitView: View {
    @State private var newHabit = ""
    @State private var progress = 0.0
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack {
            TextField("Enter new habit", text: $newHabit)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Slider(value: $progress)
                .padding()
            
            Button(action: {
                viewModel.addHabit(HabitModel(title: newHabit, progress: progress))
                newHabit = ""
                progress = 0
            }) {
                Text("Save")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(newHabit.isEmpty)
            .padding()
            
            Spacer()
        }
    }
}
