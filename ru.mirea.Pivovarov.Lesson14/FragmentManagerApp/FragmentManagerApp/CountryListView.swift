//
//  CountryListView.swift
//  FragmentManagerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

struct CountryListView: View {
    @EnvironmentObject private var viewModel: ViewModel

    var body: some View {
        List(viewModel.countries, selection: $viewModel.selectedCountry) { country in
            NavigationLink(value: country) {
                Text(country.name)
            }
        }
        .navigationTitle("Страны")
    }
}
