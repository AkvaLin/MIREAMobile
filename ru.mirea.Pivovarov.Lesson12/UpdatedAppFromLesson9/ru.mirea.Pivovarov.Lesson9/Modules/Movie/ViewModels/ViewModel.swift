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
    @Published var movies = [Movie]()
    
    private let movieService: MovieServiceProtocol
    
    init() {
        movieService = MovieService()
    }
    
    func saveMovie() {
        movieService.saveMovie(Movie(title: text))
    }
    
    func getMovie() {
        movie = movieService.getMovie()?.getTitle()
    }
    
    func getMovies() {
        movies = movieService.getMovies()
    }
}
