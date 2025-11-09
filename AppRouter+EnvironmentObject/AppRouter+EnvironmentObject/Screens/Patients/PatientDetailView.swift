//
//  PatientDetailView.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI


struct PatientDetailView: View {
    let patientId: Int
    var body: some View {
        Text("Patient Detail: \(patientId)")
            .navigationTitle("Patient #\(patientId)")
    }
}


#Preview {
    PatientDetailView(patientId: 2000)
}
