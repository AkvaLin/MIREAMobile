//
//  ListNoteView.swift
//  BottomNavigationApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct ListNoteView: View {
    
    @EnvironmentObject private var viewModel: NotesViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.notes, id: \.self) { note in
                Text(note)
            }
            .onDelete(perform: viewModel.removeNote)
        }
        .navigationBarTitle("Notes")
        .navigationBarItems(trailing: EditButton())
    }
}
