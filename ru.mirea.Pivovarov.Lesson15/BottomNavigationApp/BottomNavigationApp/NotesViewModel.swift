//
//  NotesViewModel.swift
//  BottomNavigationApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import Foundation

class NotesViewModel: ObservableObject {
    @Published var notes: [String] = []
    
    func addNote(_ note: String) {
        notes.append(note)
    }
    
    func removeNote(at index: IndexSet) {
        notes.remove(atOffsets: index)
    }
}
