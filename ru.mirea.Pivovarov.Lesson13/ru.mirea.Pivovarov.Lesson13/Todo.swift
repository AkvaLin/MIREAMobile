//
//  Todo.swift
//  ru.mirea.Pivovarov.Lesson13
//
//  Created by Никита Пивоваров on 01.12.2024.
//

struct Todo: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    var completed: Bool
}
