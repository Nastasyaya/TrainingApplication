//
//  RootFlow.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import SwiftUI

struct RootFlow: View {
    private enum CurrentScreen {
        case preloader
        case onboarding
    }

    private enum Destination: Hashable {
        case active(exercises: [Exercies])
        case generatedSets(sets: [GeneratedSet])
        case main
        case result(exercises: CompletedExercises)
        case settingsDetail(type: SettingsDetailView.SettingsType)
        case workoutDetail(set: GeneratedSet)
    }

    @State private var counter = 0
    @State private var currentScreen: CurrentScreen = .preloader
    @State private var path: [Destination] = []

    private let timer = Timer
        .publish(
            every: 1,
            on: .main,
            in: .common
        )
        .autoconnect()

    var body: some View {
        NavigationStack(path: $path) {
            Group {
                switch currentScreen {
                case .preloader:
                    PreloaderView()
                case .onboarding:
                    OnboardingFlow(
                        dependencies: OnboardingFlow.Dependencies(
                            onNextScreen: {
                                path.append(.main)
                            }
                        )
                    )
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .active(let exercises):
                    ActiveFlow(
                        dependencies: ActiveFlow.Dependencies(
                            exercises: exercises,
                            onNextScreen: { exercises in
                                path.append(.result(exercises: exercises))
                            }
                        )
                    )
                    .navigationBarBackButtonHidden()
                case .generatedSets(let sets):
                    GeneratedSetsFlow(
                        dependencies: GeneratedSetsFlow.Dependencies(
                            sets: sets,
                            onShowDetail: { set in
                                path.append(.workoutDetail(set: set))
                            },
                            onBack: {
                                path.removeLast()
                            }
                        )
                    )
                case .main:
                    MainTabFlow(
                        dependencies: MainTabFlow.Dependencies(
                            onShowDetail: { set in
                                path.append(.workoutDetail(set: set))
                            },
                            onViewAll: { sets in
                                path.append(.generatedSets(sets: sets))
                            },
                            onNextScreen: { nextScreen in
                                switch nextScreen {
                                case .policyDetail:
                                    path.append(.settingsDetail(type: .policy))
                                case .termsDetail:
                                    path.append(.settingsDetail(type: .terms))
                                }
                            }
                        )
                    )
                    .navigationBarBackButtonHidden()
                case .result(let exercises):
                    ResultFlow(
                        dependencies: ResultFlow.Dependencies(
                            exercises: exercises,
                            onFinish: {
                                path.removeLast(3)
                            }
                        )
                    )
                    .navigationBarBackButtonHidden()
                case .settingsDetail(let type):
                    SettingsDetailView(
                        type: type,
                        onBack: {
                            path.removeLast()
                        }
                    )
                case .workoutDetail(let set):
                    WorkoutDetailFlow(
                        dependencies: WorkoutDetailFlow.Dependencies(
                            set: set,
                            onStart: {
                                path.append(.active(exercises: set.exercises))
                            },
                            onBack: {
                                path.removeLast()
                            }
                        )
                    )
                }
            }
        }
        .onReceive(timer) { time in
            if counter == 3 {
                timer
                    .upstream
                    .connect()
                    .cancel()

                currentScreen = .onboarding
            } else {
                counter += 1
            }
        }
    }
}
