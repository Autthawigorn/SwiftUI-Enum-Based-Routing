//
//  ContentView.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//



import SwiftUI


struct ContentView: View {
    @EnvironmentObject private var router: AppRouter
    
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            NavigationStack(path: router.binding(for: .patients)) {
                PatientScreen()
//                    .navigationDestination(for: Routes.self) { $0.destination }
                    .navigationDestination(for: Route.self) { newPath in
                        return newPath.destination
                    }
            }
            .tabItem { Label("Patients", systemImage: "heart.fill") }
            .tag(AppTab.patients)
            
            
            NavigationStack(path: router.binding(for: .doctors)) {
                DoctorScreen()
                    .navigationDestination(for: Route.self) { $0.destination }
            }
            .tabItem { Label("Doctors", systemImage: "cross.case.fill") }
            .tag(AppTab.doctors)
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(AppRouter())
}
