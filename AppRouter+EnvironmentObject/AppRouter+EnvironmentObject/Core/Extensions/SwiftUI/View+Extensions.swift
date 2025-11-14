//
//  View+Extensions.swift
//  Catendar
//
//  Created by Autthawigorn on 6/10/2567 BE.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    var safeArea: UIEdgeInsets {
        if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene) {
            return windowScene.keyWindow?.safeAreaInsets ?? .zero
        }
        
        return .zero
    }
}


/// Divider
@ViewBuilder
func CustomDivider() -> some View {
    Rectangle()
        .fill(.appBrown.opacity(0.1))
        .frame(height: 1)
}
