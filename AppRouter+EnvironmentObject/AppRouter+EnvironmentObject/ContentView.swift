//
//  ContentView.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 9/11/2568 BE.
//



import SwiftUI


//struct ContentView: View {
//    @EnvironmentObject private var router: AppRouter
//    
//    
//    var body: some View {
//        TabView(selection: $router.selectedTab) {
//            NavigationStack(path: router.binding(for: .patients)) {
//                PatientScreen()
//                    .navigationDestination(for: Route.self) { $0.destination }
//            }
//            .tabItem { Label("Patients", systemImage: "heart.fill") }
//            .tag(AppTab.patients)
//            
//            
//            NavigationStack(path: router.binding(for: .doctors)) {
//                DoctorScreen()
//                    .navigationDestination(for: Route.self) { $0.destination }
//            }
//            .tabItem { Label("Doctors", systemImage: "cross.case.fill") }
//            .tag(AppTab.doctors)
//        }
//        .toolbarVisibility(.hidden, for: .tabBar)
//    }
//}

struct ContentView: View {
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch router.selectedTab {
                case .patients:
                    NavigationStack(path: router.binding(for: .patients)) {
                        PatientScreen()
                            .navigationDestination(for: Route.self) { $0.destination }
                    }
                case .doctors:
                    NavigationStack(path: router.binding(for: .doctors)) {
                        DoctorScreen()
                            .navigationDestination(for: Route.self) { $0.destination }
                    }
                default:
                    Text("\(router.selectedTab.title) Screen")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.yellow.opacity(0.95))
                        .foregroundColor(.white)
                }
            }

            CustomTabBar()
        }
        .background(Color.black.ignoresSafeArea())
        //.environmentObject(router)
    }
}



#Preview {
    ContentView()
        .environmentObject(AppRouter())
}
