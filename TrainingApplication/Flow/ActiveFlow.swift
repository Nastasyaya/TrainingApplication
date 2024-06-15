//
//  ActiveFlow.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import SwiftUI

struct ActiveFlow: View {
    struct Dependencies {
        let onNextScreen: () -> Void
    }

    let dependencies: Dependencies

    var body: some View {
        ActiveView(
            viewModel: ActiveViewModel(
                onFinish: dependencies.onNextScreen
            )
        )
    }
}
