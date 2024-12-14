//
//  StatisticsView.swift
//  NavigationDrawerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct StatisticsView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Your Progress")
                .font(.title)
                .padding()
            
            ProgressView(value: viewModel.progress)
                .progressViewStyle(LinearProgressViewStyle(tint: .accentColor))
                .padding()
            
            Spacer()
        }
    }
}
