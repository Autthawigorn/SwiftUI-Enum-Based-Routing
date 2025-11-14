//
//  Fonts.swift
//  Catendar
//
//  Created by Autthawigorn on 30/11/2567 BE.
//

import SwiftUI

extension Font {
    enum CustomFont {
        // Header styles
        static let subscriptionHeader = Font.system(size: 30, weight: .heavy, design: .rounded)
        static let header = Font.system(size: 17, weight: .bold, design: .rounded)
        // Title styles
        static let title1 = Font.system(size: 17, weight: .medium, design: .rounded)
        static let title2 = Font.system(size: 17, weight: .regular, design: .rounded)
        
        // Body styles
        static let bodyBold = Font.system(size: 15, weight: .semibold, design: .rounded)
        static let bodySemiBold = Font.system(size: 15, weight: .medium, design: .rounded)
        static let body = Font.system(size: 15, weight: .regular, design: .rounded)
        
        // Caption styles
        static let smallBold = Font.system(size: 13, weight: .semibold, design: .rounded)
        static let small = Font.system(size: 13, weight: .regular, design: .rounded)
    }
}



/*
// Custom Font Extension for Nunito
extension Font {
    enum Nunito {
        // Header styles
        static let header = Font.custom("Nunito-ExtraBold", size: 17)
        // Title styles
        static let title1 = Font.custom("Nunito-SemiBold", size: 17)
        static let title2 = Font.custom("Nunito-Medium", size: 17)
        
        // Body styles
        static let bodyBold = Font.custom("Nunito-Bold", size: 15)
        static let bodySemiBold = Font.custom("Nunito-SemiBold", size: 15)
        static let body = Font.custom("Nunito-Medium", size: 15)
        
        // Caption styles
        static let smallBold = Font.custom("Nunito-Bold", size: 13)
        static let small = Font.custom("Nunito-Medium", size: 13)
    }
}

// UIFont extension for registering fonts (if needed)
extension UIFont {
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            print("Couldn't register font")
            return
        }
        
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}

*/
