//
//  UserDefaultsService.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 19.10.2024.
//

import Foundation

struct UserDefaultsService {
    static func save(data: Data, forKey key: String) {
        let defaults = UserDefaults.standard
        
        defaults.set(data, forKey: key)
    }
    
    static func get(forKey key: String) -> Data? {
        let defaults = UserDefaults.standard

        return defaults.object(forKey: key) as? Data
    }
}
