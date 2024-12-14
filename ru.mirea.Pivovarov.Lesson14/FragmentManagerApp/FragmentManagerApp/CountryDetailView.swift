//
//  CountryDetailView.swift
//  FragmentManagerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct CountryDetailView: View {
    @EnvironmentObject private var viewModel: ViewModel

    var body: some View {
        VStack {
            if let country = viewModel.selectedCountry {
                Text(country.name)
                    .font(.largeTitle)
                    .bold()
                Text(country.details)
                    .font(.body)
                    .padding(.top)
            } else {
                Text("Выберите страну")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .navigationTitle("Детали")
    }
}
