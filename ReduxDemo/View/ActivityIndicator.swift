//
//  ActivityIndicator.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/17.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityIndicator : UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>)
        -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
}
