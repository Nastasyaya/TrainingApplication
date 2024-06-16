//
//  Exercies.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import Foundation

struct Exercies: Hashable {
    let name: String
    let repeatingCount: String
    let description: String
}

extension Exercies {
    static var mock: Self {
        Exercies(
            name: "Exercies",
            repeatingCount: "12",
            description: """
                Begin in a plank position, lower your body until your chest nearly touches the floor, then push back up.
            """
        )
    }
}
