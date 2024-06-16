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

    private struct ExerciesParameters {
        let repeatingCount: String
        let description: String
    }
    
    private enum ExerciesDescriptions {
        static let pushUps = [
            "Begin in a plank position",
            "lower your body until your chest nearly touches the floor",
            "then push back up."
        ].joined(separator: ", ")

        static let jumpingJacks = [
            "Stand upright with your legs together and arms at your sides",
            "then jump to spread your legs and lift your arms overhead."
        ].joined(separator: ", ")

        static let squats = [
            "Stand with feet shoulder-width apart",
            "lower your hips back and down as if sitting in a chair",
            "then return to standing."
        ].joined(separator: ", ")

        static let lunges = [
            "Step forward with one leg",
            "lowering your hips until both knees are bent at about a 90-degree angle",
            "then return to standing."
        ].joined(separator: ", ")

        static let plank = [
            "Hold a push-up position with your body in a straight line from shoulders to ankles",
            "engaging your core."
        ].joined(separator: ", ")

        static let burpees = [
            "From a standing position, drop into a squat, kick your feet back to a plank",
            "perform a push-up, return to squat, and jump up."
        ].joined(separator: ", ")

        static let highKnees = [
            "Run in place",
            "bringing your knees up towards your chest as high as possible with each step."
        ].joined(separator: ", ")

        static let mountainClimbers = [
            "Start in a plank position",
            "drive one knee toward your chest",
            "then switch legs rapidly."
        ].joined(separator: ", ")

        static let bicycleCrunches = [
            "Lie on your back",
            "lift your legs and shoulders",
            "and perform a cycling motion while bringing opposite elbows to knees."
        ].joined(separator: ", ")

        static let jumpSquats = [
            "Perform a squat and then jump explosively",
            "landing softly and immediately going into the next squat."
        ].joined(separator: ", ")

        static let dumbbellRows = [
            "With a dumbbell in one hand, bend over and pull the weight to your hip",
            "keeping your back straight."
        ].joined(separator: ", ")
        
        static let tricepDips = [
            "Using a bench or chair",
            "lower your body by bending your elbows",
            "then push back up to the starting position."
        ].joined(separator: ", ")
        
        static let legRaises = [
            "Lie on your back with legs straight",
            "lift them towards the ceiling",
            "then lower them back down without touching the ground."
        ].joined(separator: ", ")
        
        static let twists = [
            "Sit on the ground with knees bent",
            "lean back slightly and twist your torso",
            "tapping the ground on each side."
        ].joined(separator: ", ")
        
        static let calfRaises = [
            "Stand with feet shoulder-width apart",
            "lift your heels off the ground",
            "then slowly lower them back down."
        ].joined(separator: ", ")
        
        static let pullUps = [
            "Hang from a pull-up bar with an overhand grip",
            "pull your body up until your chin is above the bar",
            "then lower back down."
        ].joined(separator: ", ")
        
        static let sidePlank = [
            "Lie on your side",
            "prop yourself up on one elbow",
            "and hold your body in a straight line."
        ].joined(separator: ", ")
        
        static let deadlifts = [
            "With feet hip-width apart",
            "lift a barbell from the ground to hip level",
            "keeping your back straight and core engaged."
        ].joined(separator: ", ")
        
        static let flutterKicks = [
            "Lie on your back with legs extended",
            "lift them slightly off the ground, and flutter them in a small",
            "quick motion."
        ].joined(separator: ", ")
        
        static let boxJumps = [
            "Jump onto a sturdy box or platform",
            "landing softly",
            "then step or jump back down."
        ].joined(separator: ", ")
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

    private let exercies: [String: ExerciesParameters] = [
        "Push-Ups": ExerciesParameters(repeatingCount: "15", description: ExerciesDescriptions.pushUps),
        "Jumping Jacks": ExerciesParameters(repeatingCount: "30", description: ExerciesDescriptions.jumpingJacks),
        "Squats": ExerciesParameters(repeatingCount: "20", description: ExerciesDescriptions.squats),
        "Lunges": ExerciesParameters(repeatingCount: "15 each leg", description: ExerciesDescriptions.lunges),
        "Plank": ExerciesParameters(repeatingCount: "60 seconds", description: ExerciesDescriptions.plank),
        "Burpees": ExerciesParameters(repeatingCount: "12", description: ExerciesDescriptions.burpees),
        "High Knees": ExerciesParameters(repeatingCount: "25 each leg", description: ExerciesDescriptions.highKnees),
        "Mountain Climbers": ExerciesParameters(
            repeatingCount: "20 each leg",
            description: ExerciesDescriptions.mountainClimbers
        ),
        "Bicycle Crunches": ExerciesParameters(
            repeatingCount: "20 each side",
            description: ExerciesDescriptions.bicycleCrunches
        ),
        "Jump Squats": ExerciesParameters(repeatingCount: "15", description: ExerciesDescriptions.jumpSquats),
        "Dumbbell Rows": ExerciesParameters(
            repeatingCount: "12 each arm",
            description: ExerciesDescriptions.dumbbellRows
        ),
        "Tricep Dips": ExerciesParameters(repeatingCount: "15", description: ExerciesDescriptions.tricepDips),
        "Leg Raises": ExerciesParameters(repeatingCount: "15", description: ExerciesDescriptions.legRaises),
        "Twists": ExerciesParameters(repeatingCount: "20 each side", description: ExerciesDescriptions.twists),
        "Calf Raises": ExerciesParameters(repeatingCount: "20", description: ExerciesDescriptions.calfRaises),
        "Pull-Ups": ExerciesParameters(repeatingCount: "10", description: ExerciesDescriptions.pullUps),
        "Side Plank": ExerciesParameters(
            repeatingCount: "30 seconds each side",
            description: ExerciesDescriptions.sidePlank
        ),
        "Deadlifts": ExerciesParameters(repeatingCount: "12", description: ExerciesDescriptions.deadlifts),
        "Flutter Kicks": ExerciesParameters(
            repeatingCount: "30 seconds",
            description: ExerciesDescriptions.flutterKicks
        ),
        "Box Jumps": ExerciesParameters(
            repeatingCount: "12",
            description: ExerciesDescriptions.boxJumps
        )
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
        let exercies = exercies.map { name, parameters in
            Exercies(
                name: name,
                repeatingCount: parameters.repeatingCount,
                description: parameters.description
            )
        }

        return Array(exercies.prefix(count)).sorted(by: { $0.name < $1.name })
    }
}
