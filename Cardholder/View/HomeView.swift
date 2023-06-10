//
//  HomeView.swift
//  Cardholder
//
//  Created by dsm 5e on 08.06.2023.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedItem: CategoryModel?
    @State private var blur: Bool = false
    
    
    @State private var columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        VStack {
            
            if self.selectedItem == nil {
                
                Header()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(CardModel.cards) { card in
                            VStack {
                                GeometryReader { gee in
                                    CardItemView(colors: card.colors)
                                        .rotation3DEffect(.degrees(-Double(gee.frame(in: .global).minX / 15)), axis: (x: 0, y: 1, z: 0))
                                }
                                .frame(width: 250, height: 250)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            ZStack {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(CategoryModel.categories) { item in
                        CategoryItemView(item: item)
                            .onLongPressGesture {
                                withAnimation(.spring()) { tapToCategory(item) }
                            }
                    }
                }
                .zIndex(1)
                
                if blur {
                    VisualBlurEffect(uiVisualEffect: UIBlurEffect(style: .systemUltraThinMaterial))
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            tapToBack()
                        }
                        .zIndex(2)
                }
                
                if self.selectedItem != nil {
                    CategoryDetailView(item: self.selectedItem!)
                        .zIndex(3)
                }
            }
            .offset(y: selectedItem == nil ? -50 : 0)
            .frame(maxWidth: .infinity, maxHeight: self.selectedItem == nil ? 250 : .infinity)
            
            Spacer()
            
            if selectedItem == nil {
                Button {
                    print("Button is tapped")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                        Text("Open any card")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 42)
                .padding(32)
            }
            Spacer()
        }
        .background(.gray.opacity(0.1))
    }
    
    @ViewBuilder private func Header() -> some View {
        HStack {
            Text("Welcome back, \nIvan!")
                .font(.system(size: 22, weight: .bold, design: .default))
                .foregroundColor(.accentColor)
            
            Spacer()
            ZStack {
                Circle()
                    .foregroundColor(Color("lightGreen"))
                Image("memoji")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 55, height: 55)
        }
        .padding(.horizontal)
    }
    
    @MainActor
    func tapToBack() {
        withAnimation(.spring()) { self.blur = false }
        withAnimation(.spring()) { self.selectedItem = nil }
    }
    
    @MainActor
    func tapToCategory(_ item: CategoryModel) {
        withAnimation(.spring()) { self.selectedItem = item }
        withAnimation(.spring()) { self.blur = true }
    }
}
