//
//  WorkoutDetailViewModel.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import Foundation

final class WorkoutDetailViewModel {
    enum Action {
        case start
        case back
    }
    
    struct Content {
        let title: String
        let tags: [TagItemViewModel]
        let rows: [ExercisesListRowViewModel]
    }

    let content: Content
    private let onAction: (Action) -> Void

    init(
        set: GeneratedSet,
        onAction: @escaping (Action) -> Void
    ) {
        self.onAction = onAction

        content = Content(
            title: set.name,
            tags: [
                TagItemViewModel(
                    label: [set.duration, "min."].joined(separator: " "),
                    image: "clock"
                ),
                TagItemViewModel(
                    label: "\(set.exercises.count) exer.",
                    image: "clock"
                )
            ],
            rows: set.exercises.map {
                ExercisesListRowViewModel(
                    label: $0.name,
                    caption: $0.repeatingCount
                )
            }
        )
    }
    
    func startTapped() {
        onAction(.start)
    }
    
    func backTapped() {
        onAction(.back)
    }
}
