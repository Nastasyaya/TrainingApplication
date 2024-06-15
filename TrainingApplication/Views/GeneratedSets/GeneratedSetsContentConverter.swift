//
//  GeneratedSetsContentConverter.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import Foundation

extension GeneratedSetsViewModel {
    struct ContentConverter {
        func convert(
            from sets: [GeneratedSet],
            showSetDetailAction: @escaping (
                _ set: GeneratedSet
            ) -> Void
        ) -> [NavigationItemViewModel] {
            sets.map { set in
                NavigationItemViewModel(
                    label: set.name,
                    tags: [
                        TagItemViewModel(
                            label: [set.duration, "min."].joined(separator: " "),
                            image: "clock"
                        ),
                        TagItemViewModel(
                            label: "\(set.exercises.count) exer.",
                            image: "football.fill"
                        )
                    ],
                    action: {
                        showSetDetailAction(set)
                    }
                )
            }
        }
    }
}
