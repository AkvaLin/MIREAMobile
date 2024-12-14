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
        VStack {
            AsyncImage(url: imageURL) { result in
                Group {
                    switch result {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    default:
                        Image(systemName: "photo")
                            .resizable()
                            .background(Color.gray.opacity(0.3))
                            .scaledToFill()
                    }
                }
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .padding()
            Toggle("Is completed", isOn: $isCompleted)
        }
        .padding()
        .navigationTitle(selectedTodo.title)
        .navigationBarTitleDisplayMode(.large)
        .onChange(of: isCompleted) {
            onUpdate()
        }
    }
}
