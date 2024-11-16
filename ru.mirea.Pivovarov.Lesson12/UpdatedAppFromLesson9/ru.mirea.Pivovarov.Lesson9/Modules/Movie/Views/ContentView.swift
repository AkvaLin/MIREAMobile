//
//  ContentView.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if let movie = viewModel.movie {
                    Text(movie)
                } else {
                    Text("Нет данных")
                }
                Button("Отобразить любимый фильм") {
                    viewModel.getMovie()
                }
                .padding()
                TextField("Заполни меня", text: $viewModel.text)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                Button("Сохранить любимый фильм") {
                    viewModel.saveMovie()
                }
                .padding()
                ForEach(viewModel.movies) { movie in
                    Text(movie.getTitle())
                    Divider()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .onAppear {
            viewModel.getMovies()
        }
    }
}

#Preview {
    ContentView()
}
