//
//  MovieServiceProtocol.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 19.10.2024.
//

protocol MovieServiceProtocol {
    static func saveMovie(_ movie: MovieModel)
    static func getMoview() -> MovieModel?
}
