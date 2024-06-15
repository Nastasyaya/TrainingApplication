//
//  WorkoutViewModel.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import Foundation

final class WorkoutViewModel: ObservableObject {
    enum Action {
        case showDetail(set: GeneratedSet)
        case viewAll(sets: [GeneratedSet])
    }

    @Published var inputSearchText: String = ""
    @Published private(set) var navigationItems: [NavigationItemViewModel] = []

    private let contentConverter: ContentConverter
    private let service: GeneratedSetsService
    private let onAction: (Action) -> Void

    init(
        contentConverter: ContentConverter,
        service: GeneratedSetsService,
        onAction: @escaping (Action) -> Void
    ) {
        self.contentConverter = contentConverter
        self.service = service
        self.onAction = onAction

        observeInputSearchText()
    }
    
    func onAppear() {
        navigationItems = makeContent(from: service.createSets())
    }

    func viewAllTapped() {
        onAction(.viewAll(sets: service.createSets()))
    }
}

private extension WorkoutViewModel {
    func observeInputSearchText() {
        $inputSearchText
            .compactMap { [weak self] inputText in
                self?.handleNavigationItems(from: inputText)
            }
            .assign(to: &$navigationItems)
    }
    
    func handleNavigationItems(from inputText: String) -> [NavigationItemViewModel] {
        guard !inputText.isEmpty else {
            return makeContent(from: service.createSets())
        }

        let sortedSets = service
            .createSets()
            .filter { $0.name.contains(inputText) }

        return makeContent(from: sortedSets)
    }
}

private extension WorkoutViewModel {
    func makeContent(from sets: [GeneratedSet]) -> [NavigationItemViewModel] {
        contentConverter.convert(
            from: sets,
            onShowSetDetailAction: { [weak self] set in
                self?.onAction(.showDetail(set: set))
            }
        )
    }
}
