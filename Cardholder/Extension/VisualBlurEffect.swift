//
//  VisualBlurEffect.swift
//  Cardholder
//
//  Created by dsm 5e on 10.06.2023.
//

import SwiftUI

struct VisualBlurEffect: UIViewRepresentable {
    
    var uiVisualEffect: UIVisualEffect?
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = uiVisualEffect
    }
    
}
