//
//  SettingsFlow.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import SwiftUI

struct SettingsFlow: View {
    enum NextScreen {
        case policyDetail
        case termsDetail
    }

    struct Dependencies {
        let onNextScreen: (NextScreen) -> Void
    }

    let dependencies: Dependencies

    var body: some View {
        SettingsView(
            viewModel: SettingsViewModel { action in
                switch action {
                case .openPolicyDetail:
                    dependencies.onNextScreen(.policyDetail)
                case .openTermsDetail:
                    dependencies.onNextScreen(.termsDetail)
                }
            }
        )
    }
}
