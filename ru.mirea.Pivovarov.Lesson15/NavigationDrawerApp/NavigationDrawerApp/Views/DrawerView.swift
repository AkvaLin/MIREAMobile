//
//  DrawerView.swift
//  NavigationDrawerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct DrawerView: View {
    @Binding var selectedNavigationItem: UUID
    @Binding var isDrawerOpen: Bool
    let items: [DrawerItem]
    let width = UIScreen.main.bounds.width / 2
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.background)
                    .frame(width: width)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading) {
                    ForEach(items, id: \.self) { item in
                        RowView(
                            isSelected: selectedNavigationItem == item.id,
                            imageName: item.image,
                            title: item.title
                        ) {
                            selectedNavigationItem = item.id
                            isDrawerOpen.toggle()
                        }
                    }
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: width)
            }
            Spacer()
        }
    }
    
    func RowView(
        isSelected: Bool,
        imageName: String,
        title: String,
        action: @escaping () -> Void
    ) -> some View {
        Button {
            action()
        } label: {
            HStack(spacing: 20) {
                Rectangle()
                    .fill(isSelected ? Color.accentColor : .white)
                    .frame(width: 5)
                Image(systemName: imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? .black : .gray)
                    .frame(width: 26, height: 26)
                Text(title)
                    .font(.system(size: 14, weight: .regular))
                Spacer()
            }
        }
        .frame(height: 50)
        .background(isSelected ? Color.accentColor.opacity(0.5) : .white)
    }
}
