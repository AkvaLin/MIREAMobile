//
//  ru_mirea_Pivovarov_Lesson12App.swift
//  ru.mirea.Pivovarov.Lesson12
//
//  Created by Никита Пивоваров on 16.11.2024.
//

import SwiftUI

@main
struct ru_mirea_Pivovarov_Lesson12App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Geometry Progression", systemImage: "numbers") {
                    GeometryProgression()
                }
                Tab("Books", systemImage: "books.vertical") {
                    BookList()
                }
                Tab("Events", systemImage: "calendar") {
                    HistoricalEvents()
                }
            }
        }
    }
}
