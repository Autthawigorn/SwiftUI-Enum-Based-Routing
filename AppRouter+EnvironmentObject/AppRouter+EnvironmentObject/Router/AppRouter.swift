//
//  AppRouter.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI
import Combine


/// AppRouter เป็น single source of truth สำหรับ navigation state ของแอป
/// เก็บ NavigationPath แยกตามแท็บ และให้ฟังก์ชัน navigate ที่ type-safe
final class AppRouter: ObservableObject {
    @Published var selectedTab: AppTab = .patients
    @Published var routes: [AppTab: NavigationPath] = [:]
    
    
    init() {
        // ตั้งค่าเริ่มต้นถ้าต้องการ
        routes[.patients] = NavigationPath()
        routes[.doctors] = NavigationPath()
    }
    
    
    func binding(for tab: AppTab) -> Binding<NavigationPath> {
        Binding(
            get: { self.routes[tab, default: NavigationPath()] },
            set: { self.routes[tab] = $0 }
        )
    }
    
    
    /// Type-safe navigation
    func navigate(_ route: Route, in tab: AppTab? = nil) {
        // ถ้าไม่ได้ระบุ tab ให้ใช้ selectedTab
        let targetTab = tab ?? selectedTab
        var path = routes[targetTab, default: NavigationPath()]
        path.append(route)
        routes[targetTab] = path
    }
    
    
    /// Pop back one level ในแท็บที่ระบุ (หรือ current)
    func pop(in tab: AppTab? = nil) {
        let targetTab = tab ?? selectedTab
        var path = routes[targetTab, default: NavigationPath()]

        // ใช้ removeLast() แทน popLast()
        if !path.isEmpty {
            path.removeLast()
            routes[targetTab] = path
        }
    }

    
    /// Reset path ของแท็บ
    func reset(in tab: AppTab? = nil) {
        let targetTab = tab ?? selectedTab
        routes[targetTab] = NavigationPath()
    }
}
