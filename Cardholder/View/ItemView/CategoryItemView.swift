//
//  CategoryItemView.swift
//  Cardholder
//
//  Created by dsm 5e on 09.06.2023.
//

import SwiftUI

struct CategoryItemView: View {
    
    var item: CategoryModel
    
    var body: some View {
                
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                Text(item.title)
                
                Spacer()
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.gray.opacity(0.1))
                        .frame(width: 130)
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color(item.color))
                        .frame(width: CGFloat(item.percent) * 1.3)
                }
                .frame(height: 15)
            }
            .padding()
        }
        .frame(width: 160, height: 100)
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(item: .init(title: "1", color: "lightBlue", percent: 23))
    }
}
