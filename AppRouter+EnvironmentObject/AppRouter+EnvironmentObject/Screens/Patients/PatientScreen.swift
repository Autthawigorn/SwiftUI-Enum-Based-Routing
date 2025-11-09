//
//  PatientScreen.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI


struct PatientScreen: View {
    @EnvironmentObject private var router: AppRouter
    
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Patient Home")
                .font(.title)
            
            
            Button("Open Patient List") {
                router.navigate(.patients(.list))
            }
            
            
            Button("Open Patient Detail (id=5)") {
                router.navigate(.patients(.detail(id: 5)))
            }
        }
        .padding()
        .navigationTitle("Patients")
    }
}

