//
//  GeneratedSet.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import Foundation

struct GeneratedSet {
    private let id = UUID()

    let name: String
    let duration: String
    let exercises: [Exercies]
}

extension GeneratedSet {
    static var mock: Self {
        GeneratedSet(
            name: "Set",
            duration: "12",
            exercises: [.mock]
        )
    }
}

extension GeneratedSet: Hashable {
    static func == (lhs: GeneratedSet, rhs: GeneratedSet) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
