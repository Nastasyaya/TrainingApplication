//
//  NavigationItemViewModel.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 05.06.2024.
//

import Foundation

struct NavigationItemViewModel: Identifiable {
    let id = UUID()
    let leftImage: String
    let label: String
    let tags: [TagItemViewModel]
    let action: () -> Void

    init(
        leftImage: String = Images.Backgrounds.detail,
        label: String,
        tags: [TagItemViewModel],
        action: @escaping () -> Void
    ) {
        self.leftImage = leftImage
        self.label = label
        self.tags = tags
        self.action = action
    }
}

extension NavigationItemViewModel: Hashable {
    static func == (
        lhs: NavigationItemViewModel,
        rhs: NavigationItemViewModel
    ) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension NavigationItemViewModel {
    static func makeMock(
        label: String,
        action: @escaping () -> Void
    ) -> Self {
        NavigationItemViewModel(
            leftImage: Images.Backgrounds.detail,
            label: label,
            tags: [
                TagItemViewModel(label: "30 min.", image: "clock"),
                TagItemViewModel(label: "15 exer.", image: "clock")
            ],
            action: action
        )
    }
}
