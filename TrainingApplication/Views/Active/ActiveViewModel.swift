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

    private let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    private let startTime: Date = .now

    private let exercises: [Exercies]
    private let onFinish: () -> Void

    init(
        exercises: [Exercies],
        onFinish: @escaping () -> Void
    ) {
        self.exercises = exercises
        self.onFinish = onFinish
    }

    func onAppear() {
        timer
            .compactMap { [weak self] output in
                self?.formattedString(from: output)
            }
            .assign(to: &$currentTime)
        
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

        guard isPauseTapped else {
            onAppear()
            return
        }

        timer
            .upstream
            .connect()
            .cancel()
    }

    func nextExercies() {
        guard checkCorrectIndex() else {
            onFinish()
            return
        }

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
    }

    func finishTapped() {
        onFinish()
    }

    func showAlertTapped() {
        isAlertShown = true
    }

    func hideAlertTapped() {
        isAlertShown = false
    }
}

// MARK: - SupportMethods
private extension ActiveViewModel {
    func checkCorrectIndex() -> Bool {
        currentExerciesIndex < exercises.count - 1
    }

    func formattedString(
        from publisher: Publishers.Autoconnect<Timer.TimerPublisher>.Output
    ) -> String {
        let timeInterval = publisher.timeIntervalSince(startTime)

        return Duration(
            secondsComponent: Int64(timeInterval),
            attosecondsComponent: 0
        )
        .formatted(.time(pattern: .minuteSecond))
    }
}
