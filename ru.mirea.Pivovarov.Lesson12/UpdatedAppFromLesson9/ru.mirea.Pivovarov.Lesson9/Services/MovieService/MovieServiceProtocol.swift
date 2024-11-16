//
//  MovieServiceProtocol.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 19.10.2024.
//

protocol MovieServiceProtocol {
    func saveMovie(_ movie: Movie)
    func getMovie() -> Movie?
    func getMovies() -> [Movie]
}
