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
    @Published var selectedTab: AppTab = .doctors
    @Published var routes: [AppTab: NavigationPath] = [:]
    
    
    init() {
        // ตั้งค่าเริ่มต้นถ้าต้องการ
        routes[.patients] = NavigationPath()
        routes[.doctors] = NavigationPath()
    }
    
    // MARK: - Binding Helper
    
    /// คืนค่า Binding ของ NavigationPath สำหรับแต่ละแท็บ
    /// ใช้เชื่อมกับ NavigationStack(tab) เพื่อให้แต่ละแท็บมีเส้นทางแยกกัน
    ///
    /// - Parameter tab: แท็บที่ต้องการ binding เส้นทาง
    /// - Returns: `Binding<NavigationPath>` ที่อัปเดตอัตโนมัติเมื่อ routes เปลี่ยน
    func binding(for tab: AppTab) -> Binding<NavigationPath> {
        Binding(
            get: { self.routes[tab, default: NavigationPath()] },
            set: { self.routes[tab] = $0 }
        )
    }
    
    
    // MARK: - Navigation Actions
        
        /// ใช้สำหรับ push หน้าปลายทาง (type-safe)
        ///
        /// - Parameters:
        ///   - route: เส้นทางที่ต้องการไป (เช่น `.patients(.detail(3))`)
        ///   - tab: ถ้าไม่ระบุ จะใช้แท็บปัจจุบัน (`selectedTab`)
    func navigate(_ route: Route, in tab: AppTab? = nil) {
        // ถ้าไม่ได้ระบุ tab ให้ใช้ selectedTab
        let targetTab = tab ?? selectedTab
        var path = routes[targetTab, default: NavigationPath()]
        path.append(route)
        routes[targetTab] = path
    }
    
    
    /// Pop กลับหน้าก่อนหน้าใน NavigationStack ของแท็บที่ระบุ
    func pop(in tab: AppTab? = nil) {
        let targetTab = tab ?? selectedTab
        var path = routes[targetTab, default: NavigationPath()]

        if !path.isEmpty {
            path.removeLast()
            routes[targetTab] = path
        }
    }

    
    /// ล้างเส้นทางของแท็บ (กลับไป root)
    func reset(in tab: AppTab? = nil) {
        let targetTab = tab ?? selectedTab
        routes[targetTab] = NavigationPath()
    }
}
