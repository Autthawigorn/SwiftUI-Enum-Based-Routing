//
//  PatientRoutes.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI


// --- PatientRoutes
enum PatientRoutes: Hashable {
    case list
    case detail(id: Int)
    
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            PatientListView()
        case .detail(let id):
            PatientDetailView(patientId: id)
        }
    }
}
