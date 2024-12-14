//
//  ShareViewModel.swift
//  ResultAPIFragmentApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//


import SwiftUI

class ShareViewModel: ObservableObject {
    @Published var selectedText: String = ""
    
    func setText(_ text: String) {
        selectedText = text
    }
}
