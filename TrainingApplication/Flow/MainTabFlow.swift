//
//  MainTabFlow.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import SwiftUI

struct MainTabFlow: View {
    struct Dependencies {
        let onShowDetail: (_ set: GeneratedSet) -> Void
        let onViewAll: (_ sets: [GeneratedSet]) -> Void
        let onNextScreen: (_ nextScreen: SettingsFlow.NextScreen) -> Void
    }

    let dependencies: Dependencies

    var body: some View {
        MainTabView(
            workoutFlowBuilder: {
                WorkoutFlow(
                    dependencies: WorkoutFlow.Dependencies(
                        onShowDetail: dependencies.onShowDetail,
                        onViewAll: dependencies.onViewAll
                    )
                )
            },
            settingsFlowBuilder: {
                SettingsFlow(
                    dependencies: SettingsFlow.Dependencies(
                        onNextScreen: dependencies.onNextScreen
                    )
                )
            }
        )
        .ignoresSafeArea(.keyboard)
    }
}
