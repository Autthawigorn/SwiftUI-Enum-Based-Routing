//
//  ContentView.swift
//  Enum-BasedRouting
//
//  Created by Autthawigorn Yortpiboot on 7/11/2568 BE.
//

import SwiftUI

// MARK: - 1. โครงสร้าง NavigateAction

// struct นี้เป็นตัวกลางสำหรับ "สั่งให้เปลี่ยนหน้า (navigate)" ภายในแอป
// เราสร้างมันขึ้นมาเพื่อส่ง function การนำทางผ่าน Environment (ค่าที่แชร์ใน SwiftUI)
struct NavigateAction {
    typealias Action = (Route) -> Void // ประกาศ typealias เพื่อให้ชื่อสั้นลง
    let action: Action                  // เก็บ closure ที่จะทำงานเมื่อมีการ navigate
    
    // ฟังก์ชันพิเศษ callAsFunction ทำให้เราสามารถเรียก navigate(...) ได้โดยตรง
    func callAsFunction(_ route: Route) {
        action(route)
    }
}

// MARK: - 2. เพิ่ม NavigateAction เข้าไปใน EnvironmentValues

// SwiftUI มี EnvironmentValues สำหรับแชร์ค่าระหว่าง View
// เช่น colorScheme, locale, ฯลฯ
// ที่นี่เราสร้าง key ใหม่ชื่อ "navigate" เพื่อเก็บ NavigateAction
extension EnvironmentValues {
    @Entry var navigate = NavigateAction(action: {_ in})
}

// MARK: - 3. สร้าง Enum สำหรับ Tab ทั้งสอง

// AppTab ใช้เก็บว่าผู้ใช้เลือกแท็บไหน (Patients หรือ Doctors)
enum AppTab: Hashable {
    case patients
    case doctors
}

// MARK: - 4. เส้นทางหลัก (Route) ของแอป

// Route หลักใช้บอกว่าเราจะไปหน้าไหนของแต่ละหมวด
// เช่น .patients(.detail(5)) หมายถึงไปหน้า detail ของคนไข้ที่ id = 5
enum Route: Hashable {
    case patients(PatientRoutes)
    case doctors(DoctorRoutes)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .patients(let patientRoutes):
            patientRoutes.destination
        case .doctors(let doctorRoutes):
            doctorRoutes.destination
        }
    }
}

// MARK: - 5. เส้นทางของคนไข้ (PatientRoutes)

enum PatientRoutes: Hashable {
    case list
    case detail(Int)
    
    // ViewBuilder ทำให้เราสามารถสร้าง View ตาม case ที่เลือกได้
    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            Text("Patient List Screen")
        case .detail(let id):
            Text("Patient Detail Screen \(id)")
        }
    }
}

// MARK: - 6. เส้นทางของหมอ (DoctorRoutes)

enum DoctorRoutes: Hashable  {
    case list
    case detail(Int)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            Text("Doctor List Screen")
        case .detail(let id):
            Text("Doctor Detail Screen \(id)")
        }
    }
}

// MARK: - 7. หน้า PatientScreen
struct PatientScreen: View {
    // ดึงค่า navigate จาก Environment มาใช้
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        Button("Go to Patient List Screen"){
            // เรียก navigate เพื่อบอกให้แอปไปหน้า patients.list
            navigate(.patients(.list))
        }
    }
}

// MARK: - 8. หน้า DoctorScreen
struct DoctorScreen: View {
    var body: some View {
        Text("Doctor Screen")
    }
}

// MARK: - 9. ContentView (หน้าหลักของแอป)

struct ContentView: View {
    @State private var selectedTab: AppTab = .patients // เก็บว่าแท็บไหนถูกเลือกอยู่
    @State private var routes: [AppTab: NavigationPath] = [:]
    
    private func binding(for tab: AppTab) -> Binding<NavigationPath> {
        Binding(
            get: { routes[tab, default: NavigationPath()] },
            set: { routes[tab] = $0 }
        )
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            
            // --------- แท็บคนไข้ ----------
            Tab("Patients", systemImage: "heart", value: AppTab.patients) {
                NavigationStack(path: binding(for: .patients)) {
                    PatientScreen()
                        .navigationDestination(for: Route.self) { route in
                            route.destination
                        }
                }
            }
            
            // --------- แท็บหมอ ----------
            Tab("Doctors", systemImage: "cross", value: AppTab.doctors) {
                NavigationStack(path: binding(for: .doctors)) {
                    DoctorScreen()
                        .navigationDestination(for: Route.self) { route in
                            route.destination
                        }
                }
            }
        }
        // ส่ง NavigateAction เข้า environment ของทุก View
        .environment(\.navigate, NavigateAction(action: { route in
            var navigationPath = routes[selectedTab, default: NavigationPath()]
            navigationPath.append(route)
            routes[selectedTab] = navigationPath

        }))
    }
}

#Preview {
    ContentView()
}


