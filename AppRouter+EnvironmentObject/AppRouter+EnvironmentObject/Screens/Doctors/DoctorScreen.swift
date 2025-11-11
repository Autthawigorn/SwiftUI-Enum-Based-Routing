//
//  DoctorScreen.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//

import SwiftUI


struct DoctorScreen: View {
    @EnvironmentObject private var router: AppRouter
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Doctor Home")
                .font(.title)
            
            
            Button("Open Doctor List") {
                router.navigate(.doctors(.list))
            }
            
            
            Button("Open Doctor Detail (id=2)") {
                router.navigate(.doctors(.detail(id: 2)))
            }
            
            
//            Button("Show Patient List (from Doctor)") {
//                // ถ้าต้องการ navigate ไปอีกแท็บโดยไม่ต้องสลับแท็บก่อน
//                // สามารถระบุ tab parameter ได้ และยังคงเลือก tab ใหม่ด้วย
//                router.selectedTab = .patients
//                router.navigate(.patients(.list), in: .patients)
//            }
            
            Button("Show Patient List (from Doctor)") {
                //push หน้าของคนไข้ (route .patients(.list)) ใน stack ของแท็บ Doctor โดยไม่สลับ
                //router.navigate(.patients(.list), in: .doctors)
                router.navigate(.patients(.list))
            }
        }
        .padding()
        .navigationTitle("Doctors")
    }
}


