//
//  CardView.swift
//  Cardholder
//
//  Created by dsm 5e on 08.06.2023.
//

import SwiftUI

struct CardItemView: View {
    
    var colors: [Color]
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("BankName")
                    .font(.system(size: 19, weight: .semibold, design: .default))
                    .foregroundColor(.accentColor)
                
                Spacer()
                
                HStack {
                    Text("8574 ••••")
                    Spacer()
                    Image("mirLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 30)
                }
            }
            .padding()
        }
        .frame(width: 242, height: 153)
        .background(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
        .cornerRadius(15)
        .shadow(color: .accentColor.opacity(0.2), radius: 5, x: 4, y: 4)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardItemView(colors: [Color(Colors.lightBlue), Color(Colors.lightIndigo)])
    }
}
