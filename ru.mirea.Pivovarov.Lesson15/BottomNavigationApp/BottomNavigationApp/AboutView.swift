//
//  AboutView.swift
//  BottomNavigationApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Image(.cat)
                .resizable()
                .scaledToFit()
            Text("This is a simple notes app.")
                .padding()
            Text("It allows you to manage your notes.")
                .padding()
        }
        .navigationBarTitle("About")
    }
}
