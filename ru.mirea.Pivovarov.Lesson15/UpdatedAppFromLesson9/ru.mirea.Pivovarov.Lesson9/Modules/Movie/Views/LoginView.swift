//
//  LoginView.swift
//  ru.mirea.Pivovarov.Lesson9
//
//  Created by Никита Пивоваров on 14.12.2024.
//


import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        Form {
            TextField("Login", text: $viewModel.login)
            SecureField("Password", text: $viewModel.password)
            Button("Sign In") {
                viewModel.isLoggedIn = true
            }
            .disabled(viewModel.isSignInDisabled)
        }
    }
}