//
//  MovieServiceProtocol.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 19.10.2024.
//

import Foundation
import Combine

protocol ApiServiceProtocol {
    func getTodos() -> AnyPublisher<[Todo], Error>
    func updateData(forTodo todo: Todo) throws -> AnyPublisher<Void, Error>
    func getImageUrl(token: Int) -> URL?
}
