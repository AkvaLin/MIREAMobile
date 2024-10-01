//
//  ViewModel.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var movie: String?
    
    func saveMovie() {
        MovieService.saveMovie(MovieModel(title: text))
    }
    
    func getMovie() {
        movie = MovieService.getMoview()?.getTitle()
    }
}
