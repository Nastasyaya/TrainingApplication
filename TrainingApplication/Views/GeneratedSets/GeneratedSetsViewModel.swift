//
//  GeneratedSetsViewModel.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import Foundation

final class GeneratedSetsViewModel {
    enum Action {
        case showDetail(set: GeneratedSet)
        case back
    }

    let navigationItems: [NavigationItemViewModel]
    private let onAction: (Action) -> Void

    init(
        contentConverter: ContentConverter,
        sets: [GeneratedSet],
        onAction: @escaping (Action) -> Void
    ) {
        self.onAction = onAction

        navigationItems = contentConverter.convert(
            from: sets,
            showSetDetailAction: { set in
                onAction(.showDetail(set: set))
            }
        )
    }
    
    func backTapped() {
        onAction(.back)
    }
}
