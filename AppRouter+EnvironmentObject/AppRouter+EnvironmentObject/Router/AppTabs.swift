//
//  AppTabs.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import Foundation

enum AppTab: Hashable {
    case patients
    case doctors
    case technical
    case restock
    case assistance

    var title: String {
        switch self {
        case .patients: return "Home"
        case .doctors: return "Sales"
        case .technical: return "Technical"
        case .restock: return "Restock"
        case .assistance: return "Assistance"
        }
    }

    var icon: String {
        switch self {
        case .patients: return "house"
        case .doctors: return "chart.line.uptrend.xyaxis"
        case .technical: return "cpu"
        case .restock: return "cube.box"
        case .assistance: return "person.crop.circle.badge.questionmark"
        }
    }
}
