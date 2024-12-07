//
//  ContentView.swift
//  ru.mirea.Pivovarov.Lesson13
//
//  Created by Никита Пивоваров on 01.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        Button("Обновить данные") {
            viewModel.getTodos()
            viewModel.updateImages()
        }
        VStack {
            List {
                Section {
                    ForEach(viewModel.imageUrls) { urls in
                        AsyncImage(url: urls.url) { result in
                            result.image?
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
                Section {
                    ForEach(viewModel.todos) { todo in
                        Cell(todo: todo)
                            .environmentObject(viewModel)
                    }
                }
            }
            .alert(viewModel.alertText,
                   isPresented: $viewModel.showAlert) {}
        }
        .onAppear {
            viewModel.getTodos()
            viewModel.updateImages()
        }
    }
}

struct Cell: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    private let todo: Todo
    @State var isChecked: Bool
    
    init (todo: Todo) {
        self.todo = todo
        isChecked = todo.completed
    }
    
    var body: some View {
        HStack {
            Text(todo.title)
                .font(.headline)
            Toggle("", isOn: $isChecked)
        }
        .onChange(of: isChecked) {
            let newTodo = Todo(
                userId: todo.userId,
                id: todo.id,
                title: todo.title,
                completed: todo.completed
            )
            viewModel.updateTodo(newTodo)
        }
    }
}

#Preview {
    ContentView()
}
