//
//  CustomTabBar.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 11/11/2568 BE.
//

//import SwiftUI
//
//struct CustomTabBar: View {
//    @EnvironmentObject private var router: AppRouter
//
//    private let tabs: [AppTab] = [.patients, .doctors, .technical, .restock, .assistance]
//
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(tabs, id: \.self) { tab in
//                tabItem(for: tab)
//            }
//        }
//        .padding(.horizontal, 8)
//        .padding(.bottom, 12)
//        .padding(.top, 6)
//        .background(
//            RoundedRectangle(cornerRadius: 28)
//                .fill(Color(.red)) // dark gray background
//                .shadow(color: .black.opacity(0.25), radius: 6, y: -2)
//        )
//        .padding(.horizontal, 12)
//        .padding(.bottom, 10)
//    }
//
//    // MARK: - Tab Item Builder
//    private func tabItem(for tab: AppTab) -> some View {
//        VStack(spacing: 6) {
//            // Indicator bar
//            Rectangle()
//                .fill(router.selectedTab == tab ? Color(.red) : .clear)
//                .frame(height: 3)
//                .cornerRadius(1.5)
//                .padding(.horizontal, 12)
//                .animation(.easeInOut(duration: 0.25), value: router.selectedTab)
//
//            VStack(spacing: 4) {
//                Image(systemName: tab.icon)
//                    .font(.system(size: 18, weight: .medium))
//                    .foregroundColor(router.selectedTab == tab ? Color(.yellow) : .gray)
//
//                Text(tab.title)
//                    .font(.caption)
//                    .fontWeight(router.selectedTab == tab ? .semibold : .regular)
//                    .foregroundColor(router.selectedTab == tab ? Color(.green) : .gray)
//            }
//            .frame(maxWidth: .infinity)
//            .padding(.vertical, 6)
//        }
//        .onTapGesture {
//            router.selectedTab = tab
//            router.reset(in: tab)
//        }
//    }
//}
