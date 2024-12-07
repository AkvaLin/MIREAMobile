//
//  ContentView.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 01.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    @State private var asyncImageId = UUID()
    
    var body: some View {
        ZStack {
            background
            VStack {
                ZStack {
                    headerBackground
                    header
                        .padding([.horizontal, .top])
                }
                ScrollView {
                    VStack {
                        Text(viewModel.fact)
                            .padding(.top)
                        Button {
                            updateData()
                        } label: {
                            Label("Update", systemImage: "pawprint")
                        }
                        .padding()
                        .buttonStyle(.borderedProminent)
                        .tint(.cyan)
                    }
                    .padding()
                }
                .scrollIndicators(.hidden)
                .refreshable {
                    updateData()
                }
            }
        }
        .onAppear {
            updateData()
        }
    }
    
    private var header: some View {
        HStack {
            Text("Random cat fact")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Spacer()
            if let url = viewModel.url {
                AsyncImage(url: url,
                           transaction: .init(animation: .easeInOut)) { result in
                    if let image = result.image {
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .clipShape(Circle())
                    } else {
                        Text("😸")
                            .font(.largeTitle)
                    }
                }
                           .id(asyncImageId)
            }
        }
    }
    
    private var background: some View {
        Rectangle().fill(LinearGradient(
            gradient: Gradient(
                colors: [.blue, .pink]
            ),
            startPoint: .top,
            endPoint: .bottom)
        )
        .opacity(0.3)
        .ignoresSafeArea()
    }
    
    private var headerBackground: some View {
        Rectangle()
            .fill(.thinMaterial)
            .clipShape(UnevenRoundedRectangle(
                bottomLeadingRadius: 18,
                bottomTrailingRadius: 18)
            )
            .colorScheme(.dark)
            .mask(LinearGradient(
                gradient: Gradient(
                    colors: [
                        .black,
                        .black.opacity(0.8),
                        .black.opacity(0.4)
                    ]
                ),
                startPoint: .bottom,
                endPoint: .top)
            )
            .shadow(radius: 12)
            .ignoresSafeArea()
    }
    
    private func updateData() {
        withAnimation {
            viewModel.getCatFact()
            viewModel.getCatImageURL()
            asyncImageId = UUID()
        }
    }
}

#Preview {
    ContentView()
}
