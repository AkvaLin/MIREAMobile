//
//  Todo.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 14.12.2024.
//

struct Todo: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    var completed: Bool
    let userId: Int
}
