//
//  ActiveViewModel.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import Combine
import Foundation

final class ActiveViewModel: ObservableObject {
    struct Content {
        let currentExerciesNumber: String
        let allExercisesCount: String
        let repeatingCount: String
        let exerciesName: String
        let exerciesDescription: String
        let nextExerciesName: String
        let nextButtonTitle: String
    }
    
    private var exerciseStartTime: Date?
    private var timerSubscription: AnyCancellable? = nil
    private var accumulatedTime: TimeInterval = 0
    
    @Published var isAlertShown: Bool = false
    @Published var isPauseTapped: Bool = false
    @Published private(set) var content: Content = Content(
        currentExerciesNumber: "",
        allExercisesCount: "",
        repeatingCount: "",
        exerciesName: "",
        exerciesDescription: "",
        nextExerciesName: "",
        nextButtonTitle: ""
    )
    @Published private(set) var currentTime: String = "0:00"
    
    private var currentExerciesIndex = 0
    private var completedExercises: CompletedExercises = CompletedExercises(
        allExercisesCount: 0,
        exercises: []
    )
    
    private let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    private let exercises: [Exercies]
    private let onFinish: (_ exercises: CompletedExercises) -> Void
    
    init(
        exercises: [Exercies],
        onFinish: @escaping (_ exercises: CompletedExercises) -> Void
    ) {
        self.exercises = exercises
        self.onFinish = onFinish
        
        onAppear()
    }
}

// MARK: - Actions
extension ActiveViewModel {
    func timerButtonTapped() {
        isPauseTapped.toggle()
        
        if isPauseTapped {
            pauseTimer()
        } else {
            startTimer()
        }
    }
    
    func nextExercies() {
        guard checkCorrectIndex() else {
            saveCurrentTime()
            onFinish(completedExercises)
            return
        }
        
        saveCurrentTime()
        
        currentExerciesIndex += 1
        
        content = Content(
            currentExerciesNumber: "\(currentExerciesIndex + 1)",
            allExercisesCount: "\(exercises.count)",
            repeatingCount: exercises[currentExerciesIndex].repeatingCount,
            exerciesName: exercises[currentExerciesIndex].name,
            exerciesDescription: exercises[currentExerciesIndex].description,
            nextExerciesName: {
                guard checkCorrectIndex() else {
                    return "Finish"
                }
                return exercises[currentExerciesIndex + 1].name
            }(),
            nextButtonTitle: {
                guard checkCorrectIndex() else {
                    return "Finish"
                }
                return "Next"
            }()
        )
        resetTimer()
    }
}

// MARK: - Timer Methods
extension ActiveViewModel {
    func finishTapped() {
        saveCurrentTime()
        onFinish(completedExercises)
    }
    
    func pauseTimer() {
        if let startTime = exerciseStartTime {
            accumulatedTime += Date().timeIntervalSince(startTime)
        }
        exerciseStartTime = nil
        timerSubscription?.cancel()
    }
}

// MARK: - Work with Alert
extension ActiveViewModel {
    func showAlertTapped() {
        isAlertShown = true
    }
    
    func hideAlertTapped() {
        isAlertShown = false
    }
}

// MARK: - On Appear
extension ActiveViewModel {
    func onAppear() {
        startTimer()
        completedExercises = CompletedExercises(
            allExercisesCount: exercises.count,
            exercises: []
        )
        
        content = Content(
            currentExerciesNumber: "1",
            allExercisesCount: "\(exercises.count)",
            repeatingCount: exercises.first?.repeatingCount ?? "",
            exerciesName: exercises.first?.name ?? "",
            exerciesDescription: exercises.first?.description ?? "",
            nextExerciesName: exercises[1].name,
            nextButtonTitle: "Next"
        )
    }
}

// MARK: - Start/Reset Timer
private extension ActiveViewModel {
    func startTimer() {
        timerSubscription = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { [weak self] _ in
                guard let self = self, let startTime = self.exerciseStartTime else { return }
                let elapsed = self.accumulatedTime + Date().timeIntervalSince(startTime)
                self.currentTime = self.formattedString(from: elapsed)
            })
        
        exerciseStartTime = Date()
    }
    
    func resetTimer() {
        accumulatedTime = 0
        currentTime = "0:00"
        isPauseTapped = false
        startTimer()
    }
}


// MARK: - Save current time
private extension ActiveViewModel {
    func saveCurrentTime() {
        let totalDuration: TimeInterval
        if let startTime = exerciseStartTime {
            totalDuration = accumulatedTime + Date().timeIntervalSince(startTime)
        } else {
            totalDuration = accumulatedTime
        }
        
        let completedExercise = CompletedExercise(
            name: exercises[currentExerciesIndex].name,
            duration: totalDuration
        )
        completedExercises.exercises.append(completedExercise)
        
        accumulatedTime = 0
    }
}

// MARK: - SupportMethods
private extension ActiveViewModel {
    func checkCorrectIndex() -> Bool {
        currentExerciesIndex < exercises.count - 1
    }
    
    func formattedString(from seconds: TimeInterval) -> String {
        let minutes = Int(seconds) / 60
        let remainingSeconds = Int(seconds) % 60
        return String(format: "%d:%02d", minutes, remainingSeconds)
    }
}
