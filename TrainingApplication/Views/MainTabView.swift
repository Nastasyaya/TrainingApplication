//
//  MainTabView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 04.06.2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tabs = .workout

    @ViewBuilder let workoutFlowBuilder: () -> WorkoutFlow
    @ViewBuilder let settingsFlowBuilder: () -> SettingsFlow

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                workoutFlowBuilder()
                    .padding(.top, 24)
                    .tag(Tabs.workout)

                settingsFlowBuilder()
                    .tag(Tabs.settings)
            }

            TabBarView(selectedTab: $selectedTab)
                .padding(.bottom, -24)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
