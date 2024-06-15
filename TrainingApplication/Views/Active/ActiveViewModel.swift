//
//  ActiveViewModel.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import Foundation

final class ActiveViewModel: ObservableObject {
    @Published var isAlertShown: Bool = false
    @Published var isPauseTapped: Bool = false
    @Published private(set) var currentTime: String = "0"

    private let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    private let startTime: Date = .now

    private let onFinish: () -> Void

    init(onFinish: @escaping () -> Void) {
        self.onFinish = onFinish
    }

    func onAppear() {
        timer
            .map { [weak self] output in
                String(
                    output
                        .timeIntervalSince(self?.startTime ?? .now)
                        .rounded(.towardZero)
                )
            }
            .assign(to: &$currentTime)
    }

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
