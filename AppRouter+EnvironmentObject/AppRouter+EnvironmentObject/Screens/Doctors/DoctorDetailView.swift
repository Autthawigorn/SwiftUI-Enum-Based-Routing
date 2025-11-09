//
//  DoctorDetailView.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI


struct DoctorDetailView: View {
    @EnvironmentObject private var router: AppRouter // ลอง pop
    
    let doctorId: Int
    var body: some View {
        Text("Doctor Detail: \(doctorId)")
            .navigationTitle("Doctor #\(doctorId)")
        
        Button("Pop back") {
            router.pop()
        }
        
        Button("Go Root") {
            router.reset()
        }
           
    }
}

#Preview {
    DoctorDetailView(doctorId: 30000)
}
