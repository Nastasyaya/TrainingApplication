//
//  SettingsDetailView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import SwiftUI

struct SettingsDetailView: View {
    enum SettingsType {
        case policy
        case terms
    }
    
    let type: SettingsType
    let onBack: () -> Void

    var body: some View {
        ZStack {
            BackgroundImage(name: Images.Backgrounds.onboarding)
            
            Text(type == .terms ? "Terms" : "Policy")
                .foregroundStyle(.white)
        }
        .backButton(onBack: onBack)
        .customNavigationTitle(
            title: type == .terms ? "Terms" : "Policy"
        )
    }
}

#Preview {
    SettingsDetailView(
        type: .policy,
        onBack: {}
    )
}
