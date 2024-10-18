//
//  Model.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import Foundation

struct MovieModel: Codable {
    private let id: UUID
    private let title: String
    
    public func getTitle() -> String { title }
    
    init(title: String) {
        self.id = .init()
        self.title = title
    }
}
