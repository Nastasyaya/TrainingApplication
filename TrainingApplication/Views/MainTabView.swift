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
    
    init(
        @ViewBuilder workoutFlowBuilder: @escaping () -> WorkoutFlow,
        @ViewBuilder settingsFlowBuilder: @escaping () -> SettingsFlow
    ) {
        self.workoutFlowBuilder = workoutFlowBuilder
        self.settingsFlowBuilder = settingsFlowBuilder
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                workoutFlowBuilder()
                    .tag(Tabs.workout)
                
                settingsFlowBuilder()
                    .tag(Tabs.settings)
            }
            TabBarView(selectedTab: $selectedTab)
                .offset(y: 32)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
