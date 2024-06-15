//
//  WorkoutFlow.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import SwiftUI

struct WorkoutFlow: View {
    struct Dependencies {
        let onShowDetail: (_ set: GeneratedSet) -> Void
        let onViewAll: (_ sets: [GeneratedSet]) -> Void
    }

    let dependencies: Dependencies

    var body: some View {
        WorkoutView(
            viewModel: WorkoutViewModel(
                contentConverter: WorkoutViewModel.ContentConverter(),
                service: GeneratedSetsService(),
                onAction: { action in
                    switch action {
                    case .showDetail(let set):
                        dependencies.onShowDetail(set)
                    case .viewAll(let sets):
                        dependencies.onViewAll(sets)
                    }
                }
            )
        )
    }
}
