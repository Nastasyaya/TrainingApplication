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
    private var startTime: Date = .now
    private var completedExercises: CompletedExercises = CompletedExercises(
        allExercisesCount: 0,
        completedExercises: []
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
    }
    
    func onAppear() {
        startTimer()
        observeCurrentTime()
        completedExercises = CompletedExercises(
            allExercisesCount: exercises.count,
            completedExercises: []
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
        exerciseStartTime = Date()
        startTimer()
    }
    
    func finishTapped() {
        saveCurrentTime()
        onFinish(completedExercises)
    }
    
    func showAlertTapped() {
        isAlertShown = true
    }
    
    func hideAlertTapped() {
        isAlertShown = false
    }
    
    func pauseTimer() {
        if let startTime = exerciseStartTime {
            accumulatedTime += Date().timeIntervalSince(startTime)
        }
        exerciseStartTime = nil
        timerSubscription?.cancel()
    }
    
    func startTimer() {
        exerciseStartTime = Date()
        timerSubscription = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: {[weak self] _ in
                guard let self = self, let startTime = self.exerciseStartTime else { return }
                let elapsed = self.accumulatedTime + Date().timeIntervalSince(startTime)
                self.currentTime = self.formattedString(from: elapsed)
            })
    }
}

// MARK: - SupportMethods
private extension ActiveViewModel {
    func observeCurrentTime() {
        timerSubscription = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { [weak self] _ in
                guard let self = self, let startTime = self.exerciseStartTime else { return }
                let elapsed = self.accumulatedTime + Date().timeIntervalSince(startTime)
                self.currentTime = self.formattedString(from: elapsed)
            })
    }
    
    
    func checkCorrectIndex() -> Bool {
        currentExerciesIndex < exercises.count - 1
    }
    
    func formattedString(from seconds: TimeInterval) -> String {
        let minutes = Int(seconds) / 60
        let remainingSeconds = Int(seconds) % 60
        return String(format: "%d:%02d", minutes, remainingSeconds)
    }
}

// MARK: - SAVE CURRENT TIME
private extension ActiveViewModel {
    func saveCurrentTime() {
        guard let startTime = exerciseStartTime else { return }
        let duration = Date().timeIntervalSince(startTime)
        let completedExercise = CompletedExercise(
            name: exercises[currentExerciesIndex].name,
            duration: duration
        )
        completedExercises.completedExercises.append(completedExercise)
    }
}
