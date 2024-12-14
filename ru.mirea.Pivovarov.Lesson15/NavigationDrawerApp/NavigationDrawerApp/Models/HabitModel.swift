//
//  HabitModel.swift
//  NavigationDrawerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import Foundation

struct HabitModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let progress: Double
}
