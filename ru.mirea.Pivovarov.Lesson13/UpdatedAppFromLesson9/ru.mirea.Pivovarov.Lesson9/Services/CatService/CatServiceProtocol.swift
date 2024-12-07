//
//  MovieServiceProtocol.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 19.10.2024.
//

import Foundation
import Combine

protocol CatServiceProtocol {
    func getCatFact() -> AnyPublisher<CatFact, Error>
    func getCatImageUrl() -> URL?
}
