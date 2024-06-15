//
//  GeneratedSetsService.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import Foundation

struct GeneratedSetsService {
    private struct SetParameters {
        let duration: String
        let exerciesCount: Int
    }

    private let sets: [String: SetParameters] = [
        "Generated Set 1" : SetParameters(duration: "30", exerciesCount: 10),
        "Generated Set 2" : SetParameters(duration: "22", exerciesCount: 12),
        "Generated Set 3" : SetParameters(duration: "35", exerciesCount: 14),
        "Generated Set 4" : SetParameters(duration: "25", exerciesCount: 17),
        "Generated Set 5" : SetParameters(duration: "37", exerciesCount: 19),
        "Generated Set 6" : SetParameters(duration: "19", exerciesCount: 18),
        "Generated Set 7" : SetParameters(duration: "32", exerciesCount: 18),
        "Generated Set 8" : SetParameters(duration: "30", exerciesCount: 12),
        "Generated Set 9" : SetParameters(duration: "36", exerciesCount: 15)
    ]

    private let exercies: [String: String] = [
        "Push-Ups": "15",
        "Jumping Jacks": "30",
        "Squats": "20",
        "Lunges": "15 each leg",
        "Plank": "60 seconds",
        "Burpees": "12",
        "High Knees": "25 each leg",
        "Mountain Climbers": "20 each leg",
        "Bicycle Crunches": "20 each side",
        "Jump Squats": "15",
        "Dumbbell Rows": "12 each arm",
        "Tricep Dips": "15",
        "Leg Raises": "15",
        "Twists": "20 each side",
        "Calf Raises": "20",
        "Pull-Ups": "10",
        "Side Plank": "30 seconds each side",
        "Deadlifts": "12",
        "Flutter Kicks": "30 seconds",
        "Box Jumps": "12"
    ]

    func createSets() -> [GeneratedSet] {
        let sets = sets.map { name, parameters in
            GeneratedSet(
                name: name,
                duration: parameters.duration,
                exercises: createExercies(
                    count: parameters.exerciesCount
                )
            )
        }
        
        return Array(sets).sorted(by: { $0.name < $1.name })
    }

    private func createExercies(count: Int) -> [Exercies] {
        let exercies = exercies.map { name, repeatingCount in
            Exercies(
                name: name,
                repeatingCount: repeatingCount
            )
        }

        return Array(exercies.prefix(count)).sorted(by: { $0.name < $1.name })
    }
}
