//
//  OnboardingFlow.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import SwiftUI

struct OnboardingFlow: View {
    struct Dependencies {
        let onNextScreen: () -> Void
    }

    let dependencies: Dependencies

    var body: some View {
        OnboardingView {
            dependencies.onNextScreen()
        }
    }
}
