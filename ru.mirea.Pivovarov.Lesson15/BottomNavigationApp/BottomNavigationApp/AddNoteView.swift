//
//  AddNoteView.swift
//  BottomNavigationApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct AddNoteView: View {
    @State private var newNote: String = ""
    @EnvironmentObject var viewModel: NotesViewModel
    
    var body: some View {
        VStack {
            TextField("Enter your note", text: $newNote)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add Note") {
                if !newNote.isEmpty {
                    viewModel.addNote(newNote)
                    newNote = ""
                }
            }
            .padding()
            .disabled(newNote.isEmpty)
            
            Spacer()
        }
        .navigationBarTitle("Add Note")
        .padding()
    }
}
