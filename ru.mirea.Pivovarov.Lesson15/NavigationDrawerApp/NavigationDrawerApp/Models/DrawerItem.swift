//
//  DrawerItem.swift
//  NavigationDrawerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import Foundation
import SwiftUI

struct DrawerItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let image: String
    let view: AnyView
    
    static func == (lhs: DrawerItem, rhs: DrawerItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
