//
//  GeneratedSet.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import Foundation

struct GeneratedSet: Hashable {
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
