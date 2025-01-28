//
//  CompletedExercises.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 16.06.2024.
//

import Foundation

struct CompletedExercise: Hashable {
    let name: String
    let duration: TimeInterval
}

struct CompletedExercises: Hashable {
    let allExercisesCount: Int
    var exercises: [CompletedExercise]
    var totalTimeDuration: TimeInterval {
        exercises.reduce(0) {
            $0 + $1.duration
        }
    }
}
