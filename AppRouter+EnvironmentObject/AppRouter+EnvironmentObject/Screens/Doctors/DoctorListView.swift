//
//  DoctorListView.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI


// Supporting doctor views
struct DoctorListView: View {
    @EnvironmentObject private var router: AppRouter
    
    var body: some View {
        List(1...10, id: \.self) { i in
            Button("Doctor \(i)") {
                router.navigate(.doctors(.detail(id: i)))
            }
        }
        .navigationTitle("Doctor List")
    }
}

#Preview {
    DoctorListView()
        .environmentObject(AppRouter())
}
