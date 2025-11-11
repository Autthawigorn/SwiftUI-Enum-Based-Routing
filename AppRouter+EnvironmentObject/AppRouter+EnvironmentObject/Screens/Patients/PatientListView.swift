//
//  PatientListView.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI


// Supporting views used by PatientRoutes
struct PatientListView: View {
    @EnvironmentObject private var router: AppRouter
    
    var body: some View {
        List(1...10, id: \.self) { i in

            Button("Patient \(i)") {
                router.navigate(.patients(.detail(id: i)))
            }
        }
        .navigationTitle("Patient List")
    }
}

#Preview {
    PatientListView()
        .environmentObject(AppRouter())
}
