//
//  MovieServiec.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import Foundation
import Combine

struct ApiService: ApiServiceProtocol {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    static let baseImageURL = "https://random.imagecdn.app/"
    
    func getTodos() -> AnyPublisher<[Todo], Error> {
        guard let url = URL(string: Self.baseURL)?.appending(component: "todos") else {
            return Empty<[Todo], Error>().eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Todo].self, decoder: JSONDecoder())
            .catch { _ in Empty<[Todo], Error>() }
            .eraseToAnyPublisher()
    }
    
    func updateData(forTodo todo: Todo) throws -> AnyPublisher<Void, Error> {
        guard let url = URL(string: Self.baseURL)?.appendingPathComponent("/todos/\(todo.id)") else {
            throw CancellationError()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = try? JSONEncoder().encode(todo)
        request.allHTTPHeaderFields = ["Content-type": "application/json; charset=UTF-8"]
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap({ (data: Data, response: URLResponse) in
                guard let response = response as? HTTPURLResponse,
                        response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return
            })
            .eraseToAnyPublisher()
    }
    
    func getImageUrl(token: Int) -> URL? {
        return URL(string: Self.baseImageURL)?
            .appending(component: "\(token)")
            .appending(component: "\(token)")
    }
}
