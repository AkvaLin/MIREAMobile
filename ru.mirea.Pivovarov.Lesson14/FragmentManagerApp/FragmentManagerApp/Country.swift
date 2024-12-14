//
//  Country.swift
//  FragmentManagerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import Foundation

struct Country: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let details: String
}
