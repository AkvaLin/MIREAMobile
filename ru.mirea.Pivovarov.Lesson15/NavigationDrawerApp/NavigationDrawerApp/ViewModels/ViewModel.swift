//
//  ViewModel.swift
//  NavigationDrawerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var habits: [HabitModel] = []
    var progress: Double {
        var result = 0.0
        habits.forEach { habit in
            result += habit.progress
        }
        return result / Double(habits.count)
    }
    
    func addHabit(_ habit: HabitModel) {
        habits.append(habit)
    }
    
    func removeHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
}
