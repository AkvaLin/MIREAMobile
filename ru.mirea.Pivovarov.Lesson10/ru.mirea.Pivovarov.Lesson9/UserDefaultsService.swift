//
//  UserDefaultsService.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 19.10.2024.
//

import Foundation

struct UserDefaultsService {
    static func save(_ movie: MovieModel) {
        let defaults = UserDefaults.standard
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(movie) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "movie")
        }
    }
    
    static func get() -> MovieModel? {
        let defaults = UserDefaults.standard
        
        if let savedMovie = defaults.object(forKey: "movie") as? Data {
            let decoder = JSONDecoder()
            if let loadedMovie = try? decoder.decode(MovieModel.self, from: savedMovie) {
                return loadedMovie
            }
        }
        return nil
    }
}
