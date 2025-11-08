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
import SwiftUI

struct DoctorScreen: View {
    @Environment(\.navigate) private var navigate

    var body: some View {
        VStack {
            // ปุ่มไปหน้า Doctor Detail
            Button("Go to Doctor Detail Screen") {
                navigate(.doctors(.detail(2)))
            }

            // ปุ่มไปหน้า Patient List
            Button("Show Patient List Screen") {
                navigate(.patients(.list))
            }
        }
        .navigationTitle("Doctor Screen")
    }
}


// MARK: - 9. ContentView
struct ContentView: View {
    @State private var selectedTab: AppTab = .patients
    
    // เก็บเส้นทาง (NavigationPath) ของแต่ละแท็บแยกกัน
    // เช่น routes[.patients] กับ routes[.doctors]
    @State private var routes: [AppTab: NavigationPath] = [:]
    
    // ฟังก์ชันช่วยสร้าง Binding สำหรับแต่ละแท็บ
    // เพื่อให้ NavigationStack ของแต่ละแท็บใช้ path ของตัวเองได้
    private func binding(for tab: AppTab) -> Binding<NavigationPath> {
        Binding(
            get: { routes[tab, default: NavigationPath()] }, // ถ้ายังไม่มี path ให้ใช้ค่าเริ่มต้นใหม่
            set: { routes[tab] = $0 } // เวลา path มีการเปลี่ยน (push/pop) ให้บันทึกกลับเข้า dictionary
        )
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            
            // ---------- แท็บ Patients ----------
            Tab("Patients", systemImage: "heart", value: AppTab.patients) {
                // ใช้ NavigationStack พร้อม path ของแท็บ Patients
                NavigationStack(path: binding(for: .patients)) {
                    PatientScreen()
                        // กำหนดปลายทางเมื่อเจอ Route (คือ view ที่จะ push ไป)
                        .navigationDestination(for: Route.self) { route in
                            route.destination
                        }
                }
            }
            
            // ---------- แท็บ Doctors ----------
            Tab("Doctors", systemImage: "cross", value: AppTab.doctors) {
                // ใช้ NavigationStack พร้อม path ของแท็บ Doctors
                NavigationStack(path: binding(for: .doctors)) {
                    DoctorScreen()
                        .navigationDestination(for: Route.self) { route in
                            route.destination
                        }
                }
            }
        }
        // MARK: - ส่ง NavigateAction เข้า Environment ของทุก View
        .environment(\.navigate, NavigateAction(action: { route in
            // เมื่อ View ไหนเรียก navigate(...) มาที่นี่
            // เช่น navigate(.patients(.list)) หรือ navigate(.doctors(.detail(2)))
            
            // ดึง path ของแท็บปัจจุบัน (เช่น patients หรือ doctors)
            var navigationPath = routes[selectedTab, default: NavigationPath()]
            
            // เพิ่ม route ลงใน path → NavigationStack จะ push หน้านั้น
            navigationPath.append(route)
            
            // บันทึก path ที่อัปเดตกลับเข้า dictionary
            routes[selectedTab] = navigationPath
        }))
    }
}


#Preview {
    ContentView()
}


