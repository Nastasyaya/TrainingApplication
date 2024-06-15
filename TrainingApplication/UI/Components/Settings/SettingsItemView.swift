//
//  SettingsButton.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import SwiftUI

struct SettingsItemView: View {
    private let viewModel: SettingsItemViewModel
    
    init(
        viewModel: SettingsItemViewModel
    ) {
        self.viewModel = viewModel
    }

    var body: some View {
        Button(action: viewModel.action) {
            HStack(spacing: 8) {
                Image(systemName: viewModel.image)
                    .opacity(0.2)

                Text(viewModel.label)

                Spacer()

                Image(systemName: "chevron.forward")
                    .foregroundStyle(.white)
                    .opacity(0.2)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        SettingsItemView(
            viewModel: SettingsItemViewModel(
                image: "doc.text",
                label: "Privacy Policy",
                action: {
                    print("SettingsItem tapped")
                }
            )
        )
    }
}
