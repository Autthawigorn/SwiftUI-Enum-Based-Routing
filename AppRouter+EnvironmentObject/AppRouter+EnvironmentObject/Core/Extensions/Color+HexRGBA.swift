//
//  Color+Extension.swift
//  Catendar
//
//  Created by Autthawigorn on 6/10/2567 BE.
//

//import SwiftUI
//
//extension Color {
//    func toHex() -> String? {
//        ///converts the SwiftUI Color to a UIColor
//        let uic = UIColor(self)
//        
//        guard let components = uic.cgColor.components, components.count >= 3 else { //at least 3 components (r, g, b).
//            return nil
//        }
//        
//        let r = Float(components[0])
//        let g = Float(components[1])
//        let b = Float(components[2])
//        var a = Float(1.0)
//        
//        ///If there's a fourth component (alpha), it updates the alpha value.
//        if components.count >= 4 {
//            a = Float(components[3])
//        }
//        
//        ///If alpha is not 1.0, it includes the alpha in the hex string (8 characters).        If alpha is 1.0, it only includes RGB (6 characters).
//        if a != Float(1.0) {
//            return String(format:
//                            "%02X%02X%02X%02X", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
//        } else {
//            return String(format: "%02X%02X%02X", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
//        }
//    }
//    
//    init(hex: String) {
//        // Remove '#' if exists
//        var cleanedHex = hex
//        if hex.hasPrefix("#") {
//            cleanedHex = String(hex.dropFirst())
//        }
//
//        // Convert hex to RGB
//        var rgb: UInt64 = 0
//        Scanner(string: cleanedHex).scanHexInt64(&rgb)
//
//        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
//        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
//        let blue = Double(rgb & 0x0000FF) / 255.0
//
//        self.init(red: red, green: green, blue: blue)
//
//    }
//}
