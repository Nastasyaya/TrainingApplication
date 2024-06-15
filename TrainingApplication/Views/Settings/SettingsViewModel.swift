//
//  SettingsViewModel.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import Foundation

final class SettingsViewModel {
    enum Action {
        case openPolicyDetail
        case openTermsDetail
    }

    let items: [SettingsItemViewModel]

    init(
        onAction: @escaping (Action) -> Void
    ) {
        items = [
            SettingsItemViewModel(
                image: "doc.text",
                label: "Privacy Policy",
                action: {
                    onAction(.openPolicyDetail)
                }
            ),
            SettingsItemViewModel(
                image: "doc.text",
                label: "Terms of Use",
                action: {
                    onAction(.openTermsDetail)
                }
            )
        ]
    }
}
