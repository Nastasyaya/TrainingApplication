//
//  SettingsItemViewModel.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import Foundation

struct SettingsItemViewModel: Identifiable {
    let id = UUID()
    let image: String
    let label: String
    let action: () -> Void
}
