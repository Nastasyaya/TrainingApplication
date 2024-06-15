//
//  Exercies.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import Foundation

struct Exercies {
    let name: String
    let repeatingCount: String
}

extension Exercies {
    static var mock: Self {
        Exercies(
            name: "Exercies",
            repeatingCount: "12"
        )
    }
}
