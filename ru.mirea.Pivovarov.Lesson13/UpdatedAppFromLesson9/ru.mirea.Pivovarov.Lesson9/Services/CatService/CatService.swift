//
//  MovieServiec.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import Foundation
import Combine

struct CatService: CatServiceProtocol {
    
    private let url = URL(string: "https://catfact.ninja/fact")
    
    func getCatFact() -> AnyPublisher<CatFact, Error> {
        guard let url = url else  { return Empty<CatFact, Error>().eraseToAnyPublisher() }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CatFact.self, decoder: JSONDecoder())
            .catch { _ in Empty<CatFact, Error>() }
            .eraseToAnyPublisher()
    }
    
    func getCatImageUrl() -> URL? {
        return URL(string: "https://cataas.com/cat")
    }
}
