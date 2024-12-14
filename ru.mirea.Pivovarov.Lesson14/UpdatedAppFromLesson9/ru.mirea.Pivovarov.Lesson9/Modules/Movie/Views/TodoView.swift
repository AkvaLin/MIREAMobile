//
//  TodoView.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 14.12.2024.
//


import SwiftUI

struct TodoView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationSplitView {
            TodoListView()
                .environmentObject(viewModel)
        } detail: {
            if let todo = viewModel.selectedTodo {
                TodoDetailsView(
                    selectedTodo: todo,
                    isCompleted: $viewModel.isSelectedTodoCompleted,
                    imageURL: viewModel.getImageUrl(),
                    onUpdate: viewModel.updateTodo
                ).onAppear(perform: viewModel.onTodoDetailsViewAppear)
            } else {
                Text("Select todo")
            }
        }
        .onAppear {
            viewModel.getTodos()
        }
    }
}