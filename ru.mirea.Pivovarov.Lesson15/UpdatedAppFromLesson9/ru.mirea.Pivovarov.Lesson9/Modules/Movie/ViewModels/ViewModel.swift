//
//  ViewModel.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var login = "" {
        didSet {
            updateIsSignInDisabled()
        }
    }
    @Published var password = "" {
        didSet {
            updateIsSignInDisabled()
        }
    }
    @Published var isLoggedIn: Bool = false {
        didSet {
            token = isLoggedIn ? Int.random(in: 100...500) : nil
        }
    }
    @Published var isSignInDisabled = true
    @Published var todos = [Todo]()
    @Published var selectedTodo: Todo?
    @Published var isSelectedTodoCompleted = false
    
    private var token: Int?
    private let apiService: ApiServiceProtocol = ApiService()
    private var storage: Set<AnyCancellable> = []
    
    private func updateIsSignInDisabled() {
        isSignInDisabled = login.isEmpty || password.isEmpty
    }
    
    func getImageUrl() -> URL? {
        guard let token else { return nil }
        return apiService.getImageUrl(token: token)
    }
    
    func getTodos() {
        apiService.getTodos()
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] todos in
                self?.todos = todos
            })
            .store(in: &storage)
    }
    
    func updateTodo() {
        guard
            let todo = selectedTodo,
            let index = todos.firstIndex(of: todo)
        else { return }
        todos[index].completed = isSelectedTodoCompleted
        try? apiService.updateData(forTodo: todo)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { _ in })
            .store(in: &storage)
    }
    
    func onTodoDetailsViewAppear() {
        isSelectedTodoCompleted = selectedTodo?.completed ?? false
    }
}
