//
//  AppRouter_EnvironmentObjectApp.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI

@main
struct AppRouter_EnvironmentObjectApp: App {
    @StateObject private var router = AppRouter()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
