//
//  MovieServiec.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

struct MovieService {
    
    static func saveMovie(_ movie: MovieModel) {
        UserDefaultsService.save(movie)
    }
    
    static func getMoview() -> MovieModel? {
        UserDefaultsService.get()
    }
}
