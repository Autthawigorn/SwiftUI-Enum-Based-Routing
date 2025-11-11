//
//  CustomTabBar.swift
//  AppRouter+EnvironmentObject
//
//  Created by Autthawigorn Yortpiboot on 11/11/2568 BE.
//

import SwiftUI

struct CustomTabBar: View {
    @EnvironmentObject private var router: AppRouter

    private let tabs: [AppTab] = [.patients, .doctors, .technical, .restock, .assistance]

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(tabs, id: \.self) { tab in
                tabItem(for: tab)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 0)
        //.padding(.top, 8)
        .background(
            Rectangle()
                .fill(Color(hex: "1E1E1E")) // dark gray background
                .ignoresSafeArea()
        )
    }

    /// Tab Item View
    @ViewBuilder
    private func tabItem(for tab: AppTab) -> some View {
        VStack(spacing: 8) {
            // Indicator bar
            Rectangle()
                .fill(router.selectedTab == tab ? Color(hex: "E5C48F") : .clear)
                .frame(height: 4)
                .animation(.easeInOut(duration: 0.25), value: router.selectedTab)

            VStack(spacing: 0) {
                Image(systemName: tab.icon)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(router.selectedTab == tab ? Color(hex: "E5C48F") : .gray)

                Text(tab.title)
                    .font(.caption)
                    .fontWeight(router.selectedTab == tab ? .semibold : .regular)
                    .foregroundColor(router.selectedTab == tab ? Color(hex: "E5C48F") : .gray)
            }
            .frame(maxWidth: .infinity)
            //.padding(.vertical, 6)
        }
        .onTapGesture {
            router.selectedTab = tab
            router.reset(in: tab)
        }
    }
}
