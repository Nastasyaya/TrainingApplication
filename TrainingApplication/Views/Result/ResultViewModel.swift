//
//  ResultViewModel.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 16.06.2024.
//

import Foundation

final class ResultViewModel {
    struct Content {
        let exercisesCounter: String
        let exerciesRows: [ResultRowViewModel]
    }

    let content: Content

    private let onFinish: () -> Void

    init(
        exercises: CompletedExercises,
        onFinish: @escaping () -> Void
    ) {
        self.onFinish = onFinish

        content = Content(
            exercisesCounter: [
                "\(exercises.completedExercises.count)",
                "\(exercises.allExercisesCount)"
            ].joined(separator: "/"),
            exerciesRows: exercises.completedExercises.map {
                ResultRowViewModel(exerciesName: $0.name)
            }
        )
    }

    func completeTapped() {
        onFinish()
    }
}
