//
//  CategoryModel.swift
//  Cardholder
//
//  Created by dsm 5e on 09.06.2023.
//

import Foundation

struct CategoryModel: Identifiable {
    let id = UUID().uuidString
    
    let title: String
    let color: String
    let percent: Int
    
    static let categories = [
        CategoryModel(title: "Goods", color: Colors.lightGreen, percent: 45),
        CategoryModel(title: "Transport", color: Colors.lightBlue, percent: 30),
        CategoryModel(title: "Eduation", color: Colors.lightIndigo, percent: 15),
        CategoryModel(title: "Other", color: Colors.lightIPink, percent: 10)
    ]
}
