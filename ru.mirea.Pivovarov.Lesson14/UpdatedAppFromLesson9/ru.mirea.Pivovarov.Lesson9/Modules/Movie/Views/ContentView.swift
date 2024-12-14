//
//  ContentView.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    @State private var asyncImageId = UUID()
    
    var body: some View {
        LoginView()
            .environmentObject(viewModel)
            .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
                TodoView()
                    .environmentObject(viewModel)
            }
    }
}

struct LoginView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        Form {
            TextField("Login", text: $viewModel.login)
            SecureField("Password", text: $viewModel.password)
            Button("Sign In") {
                viewModel.isLoggedIn = true
            }
            .disabled(viewModel.isSignInDisabled)
        }
    }
}

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

struct TodoDetailsView: View {
    
    @State var selectedTodo: Todo
    @Binding var isCompleted: Bool
    let imageURL: URL?
    let onUpdate: () -> Void
    
    var body: some View {
        VStack {
            AsyncImage(url: imageURL) { result in
                Group {
                    switch result {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    default:
                        Image(systemName: "photo")
                            .resizable()
                            .background(Color.gray.opacity(0.3))
                            .scaledToFill()
                    }
                }
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .padding()
            Toggle("Is completed", isOn: $isCompleted)
        }
        .padding()
        .navigationTitle(selectedTodo.title)
        .navigationBarTitleDisplayMode(.large)
        .onChange(of: isCompleted) {
            onUpdate()
        }
    }
}

#Preview {
    ContentView()
}
