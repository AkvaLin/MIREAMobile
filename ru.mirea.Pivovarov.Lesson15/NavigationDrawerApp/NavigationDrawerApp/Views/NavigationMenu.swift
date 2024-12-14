//
//  NavigationMenu.swift
//  NavigationDrawerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct NavigationMenu: View {
    @Binding var isShowing: Bool
    @State var selectedNavigationItem: UUID
    var content: [DrawerItem]
    var edgeTransition: AnyTransition = .move(edge: .leading)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedNavigationItem) {
                ForEach(content) { item in
                    VStack {
                        HStack {
                            Button(action: {
                                isShowing.toggle()
                            }) {
                                Image(systemName: "line.horizontal.3.decrease.circle")
                                    .font(.subheadline)
                            }
                            Spacer()
                        }
                        .padding()
                        
                        Text(item.title)
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        item.view
                    }
                    .tag(item.id)
                }
            }
            
            if (isShowing) {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                DrawerView(
                    selectedNavigationItem: $selectedNavigationItem,
                    isDrawerOpen: $isShowing,
                    items: content
                )
                .transition(edgeTransition)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut(duration: 0.4), value: isShowing)
    }
}
