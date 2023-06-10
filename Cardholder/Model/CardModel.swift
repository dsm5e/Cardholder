//
//  CardModel.swift
//  Cardholder
//
//  Created by dsm 5e on 08.06.2023.
//

import SwiftUI

struct CardModel: Identifiable {
    
    var id = UUID().uuidString
    
    var colors: [Color]
    
    static let cards: [CardModel] = [
        CardModel(colors: [Color(Colors.lightIPeach), Color(Colors.lightBlue)]),
        CardModel(colors: [Color(Colors.lightIndigo), Color(Colors.lightBlue)]),
        CardModel(colors: [Color(Colors.lightGreen), Color(Colors.lightBlue)]),
        CardModel(colors: [Color(Colors.lightIPeach), Color(Colors.lightBlue)])
    ]
}
