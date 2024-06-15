//
//  GeneratedSetsFlow.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import SwiftUI

struct GeneratedSetsFlow: View {
    struct Dependencies {
        let sets: [GeneratedSet]
        let onShowDetail: (_ set: GeneratedSet) -> Void
        let onBack: () -> Void
    }

    let dependencies: Dependencies

    var body: some View {
        GeneratedSetsView(
            viewModel: GeneratedSetsViewModel(
                contentConverter: GeneratedSetsViewModel.ContentConverter(),
                sets: dependencies.sets,
                onAction: { action in
                    switch action {
                    case .showDetail(let set):
                        dependencies.onShowDetail(set)
                    case .back:
                        dependencies.onBack()
                    }
                }
            )
        )
    }
}
