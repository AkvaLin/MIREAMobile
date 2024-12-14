//
//  TodoListView.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        List(viewModel.todos, selection: $viewModel.selectedTodo) { todo in
            NavigationLink(value: todo) {
                Text(todo.title)
            }
        }
        .navigationTitle("Todo List")
    }
}
