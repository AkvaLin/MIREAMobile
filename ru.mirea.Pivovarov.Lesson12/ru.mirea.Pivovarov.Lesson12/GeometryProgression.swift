//
//  ContentView.swift
//  ru.mirea.Pivovarov.Lesson12
//
//  Created by Никита Пивоваров on 16.11.2024.
//

import SwiftUI

struct GeometryProgression: View {
    @State private var numbers = {
        var array: [UInt128] = [1]
        for i in 1..<100 {
            array.append(array[i-1] * 2)
        }
        return array
    }()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(numbers, id: \.self) { number in
                    Text("\(number)")
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    GeometryProgression()
}
