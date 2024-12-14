//
//  ViewModel.swift
//  FragmentManagerApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var selectedCountry: Country?
    let countries = [
        Country(name: "Россия", details: "Россия — самая большая страна в мире."),
        Country(name: "США", details: "США — страна с развитой экономикой."),
        Country(name: "Китай", details: "Китай — лидер по численности населения."),
        Country(name: "Индия", details: "Индия — страна богатой культуры."),
        Country(name: "Бразилия", details: "Бразилия — родина карнавалов.")
    ]
}
