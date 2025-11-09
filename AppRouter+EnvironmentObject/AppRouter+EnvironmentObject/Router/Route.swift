//
//  Route.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI


/// แยกกลุ่ม route เป็น enum ของแต่ละ module เพื่อความเป็นระเบียบ
enum Route: Hashable {
    case patients(PatientRoutes)
    case doctors(DoctorRoutes)
    
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .patients(let pr):
            pr.destination
        case .doctors(let dr):
            dr.destination
        }
    }
}

