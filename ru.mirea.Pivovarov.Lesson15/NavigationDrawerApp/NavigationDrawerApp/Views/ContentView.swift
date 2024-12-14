//
//  ContentView.swift
//  NavigationDrawerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State var isDrawerOpen: Bool = false
    var items: [DrawerItem] {
        [
            .init(
                title: "Add Habit",
                image: "plus",
                view: AnyView(
                    AddHabitView()
                        .environmentObject(viewModel)
                )
            ),
            .init(
                title: "Your Habits",
                image: "list.dash",
                view: AnyView(
                    HabitsView()
                        .environmentObject(viewModel)
                )
            ),
            .init(
                title: "Statistics",
                image: "chart.bar",
                view: AnyView(
                    StatisticsView()
                        .environmentObject(viewModel)
                )
            )
        ]
    }
    
    var body: some View {
        NavigationMenu(
            isShowing: $isDrawerOpen,
            selectedNavigationItem: items[0].id,
            content: items
        )
    }
}

#Preview {
    ContentView()
}
