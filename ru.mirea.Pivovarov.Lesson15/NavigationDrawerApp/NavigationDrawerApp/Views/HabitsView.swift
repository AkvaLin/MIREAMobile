//
//  HabitsView.swift
//  NavigationDrawerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct HabitsView: View {
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.habits) {  habit in
                VStack {
                    Text(habit.title)
                    ProgressView(value: habit.progress)
                        .progressViewStyle(LinearProgressViewStyle(tint: .accentColor))
                }
            }
            .onDelete(perform: viewModel.removeHabit)
        }
    }
}
