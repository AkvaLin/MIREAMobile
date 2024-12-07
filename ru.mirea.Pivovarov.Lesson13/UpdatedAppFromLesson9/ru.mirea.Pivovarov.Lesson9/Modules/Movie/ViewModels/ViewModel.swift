//
//  ViewModel.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var fact = ""
    @Published var url: URL?
    @Published var alertText = ""
    @Published var isAlertPresented = false
    
    private let catService: CatServiceProtocol
    private var storage: Set<AnyCancellable> = []
    
    init() {
        catService = CatService()
    }
    
    func getCatFact() {
        catService.getCatFact()
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .receive(on: DispatchQueue.main)
            .replaceError(with: { [weak self] in
                self?.alertText = "Не удалось получить данные"
                self?.isAlertPresented = true
                return .init(fact: "")
            }())
            .sink(receiveValue: { [weak self] fact in
                self?.fact = fact.fact
            })
            .store(in: &storage)
    }
    
    func getCatImageURL() {
        url = catService.getCatImageUrl()
    }
}
