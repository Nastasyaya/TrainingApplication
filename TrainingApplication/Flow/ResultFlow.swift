//
//  ResultFlow.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import SwiftUI

struct ResultFlow: View {
    struct Dependencies {
        let exercises: CompletedExercises
        let onFinish: () -> Void
    }
    
    let dependencies: Dependencies

    var body: some View {
        ResultView(
            viewModel: ResultViewModel(
                exercises: dependencies.exercises,
                onFinish: dependencies.onFinish
            )
        )
    }
}
