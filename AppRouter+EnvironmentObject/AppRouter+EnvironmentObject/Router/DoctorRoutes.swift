//
//  DoctorRoutes.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI


// --- DoctorRoutes
enum DoctorRoutes: Hashable {
    case list
    case detail(id: Int)
    
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            DoctorListView()
        case .detail(let id):
            DoctorDetailView(doctorId: id)
        }
    }
}


