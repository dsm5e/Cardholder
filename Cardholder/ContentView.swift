//
//  ContentView.swift
//  Cardholder
//
//  Created by dsm 5e on 08.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Tab = .house
    @State var selectedItem: CategoryModel? = nil
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        switch selectedTab {
                        case .house:
                            HomeView(selectedItem: $selectedItem)
                        case .creditcard:
                            SendView()
                        case .gearshape:
                            SettingsView()
                        }
                    }
                }
            }
            VStack {
                Spacer()
                if selectedItem == nil {
                    CustomTabBar(selectedTab: $selectedTab)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
