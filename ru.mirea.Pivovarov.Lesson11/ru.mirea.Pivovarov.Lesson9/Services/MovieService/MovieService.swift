//
//  MovieServiec.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import Foundation

struct MovieService: MovieServiceProtocol {
    
    func saveMovie(_ movie: Movie) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(movie) {
            UserDefaultsService.save(data: encoded, forKey: "movie")
        }
    }
    
    func getMovie() -> Movie? {
        guard let data = UserDefaultsService.get(forKey: "movie") else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(Movie.self, from: data)
    }
}
