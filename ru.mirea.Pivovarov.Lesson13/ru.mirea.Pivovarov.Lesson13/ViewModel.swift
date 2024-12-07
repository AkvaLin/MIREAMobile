//
//  ViewModel.swift
//  ru.mirea.Pivovarov.Lesson13
//
//  Created by Никита Пивоваров on 01.12.2024.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var todos: [Todo] = []
    @Published var imageUrls: [ImageUrl] = []
    @Published var alertText = ""
    @Published var showAlert = false
    
    private let apiService: ApiService
    private var storage = Set<AnyCancellable>()
    
    init() {
        self.apiService = ApiService()
    }
    
    func getTodos() {
        apiService.getTodos()
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .receive(on: DispatchQueue.main)
            .replaceError(with: { [weak self] in
                self?.alertText = "Не удалось получить данные"
                self?.showAlert = true
                return []
            }())
            .sink(receiveValue: { [weak self] todos in
                self?.todos = todos
            })
            .store(in: &storage)
    }
    
    func updateTodo(_ todo: Todo) {
        do {
            try apiService.updateData(forTodo: todo)
                .subscribe(on: DispatchQueue.global(qos: .userInitiated))
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { _ in },
                      receiveValue: { _ in })
                .store(in: &storage)
        } catch {
            alertText = "Не удалось обновить данные"
            showAlert = true
        }
    }
    
    func updateImages() {
        var temp = [ImageUrl]()
        for _ in 1...10 {
            temp.append(.init(url: URL(string: "https://random.imagecdn.app/\([50, 100, 200, 500].randomElement() ?? 500)/\(Int.random(in: 150...500))")))
        }
        imageUrls = temp
    }
}

struct ImageUrl: Identifiable {
    let id = UUID()
    let url: URL?
}
