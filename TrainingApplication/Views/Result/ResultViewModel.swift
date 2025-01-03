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
        let totaltime: String
    }

    let content: Content

    private let onFinish: () -> Void

    init(
        exercises: CompletedExercises,
        onFinish: @escaping () -> Void
    ) {
        
        self.onFinish = onFinish
        
        let totalDuration = exercises.totalTimeDuration
        let formattedTotalTime = Duration(
            secondsComponent: Int64(totalDuration),
            attosecondsComponent: 0
        ).formatted(.time(pattern: .minuteSecond))

        content = Content(
            exercisesCounter: [
                "\(exercises.completedExercises.count)",
                "\(exercises.allExercisesCount)"
            ].joined(separator: "/"),
            exerciesRows: exercises.completedExercises.map {
                ResultRowViewModel(
                    exerciesName: $0.name,
                    exerciseDuration: Duration(secondsComponent: Int64($0.duration), attosecondsComponent: 0).formatted(.time(pattern: .minuteSecond))
                )
            },
            totaltime: formattedTotalTime
        )
    }

    func completeTapped() {
        onFinish()
    }
}
