//
//  TodoDetailsView.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct TodoDetailsView: View {
    
    @State var selectedTodo: Todo
    @Binding var isCompleted: Bool
    let imageURL: URL?
    let onUpdate: () -> Void
    
    var body: some View {
        TabView {
            Tab("Content", systemImage: "note.text") {
                VStack {
                    Text(selectedTodo.title)
                        .font(.title)
                        .padding()
                    Toggle("Is completed", isOn: $isCompleted)
                        .padding()
                }
                .padding()
                .navigationBarTitleDisplayMode(.large)
                .onChange(of: isCompleted) {
                    onUpdate()
                }
            }
            
            Tab("Image", systemImage: "photo") {
                VStack {
                    AsyncImage(url: imageURL) { result in
                        Group {
                            switch result {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            default:
                                Image(systemName: "photo")
                                    .resizable()
                                    .background(Color.gray.opacity(0.3))
                                    .scaledToFit()
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    .padding()
                }
            }
        }
    }
}
