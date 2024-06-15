//
//  WorkoutDetailFlow.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//

import SwiftUI

struct WorkoutDetailFlow: View {
    struct Dependencies {
        let set: GeneratedSet
        let onStart: () -> Void
        let onBack: () -> Void
    }
    
    let dependencies: Dependencies

    var body: some View {
        WorkoutDetailView(
            viewModel: WorkoutDetailViewModel(
                set: dependencies.set,
                onAction: { action in
                    switch action {
                    case .start:
                        dependencies.onStart()
                    case .back:
                        dependencies.onBack()
                    }
                }
            )
        )
    }
}
