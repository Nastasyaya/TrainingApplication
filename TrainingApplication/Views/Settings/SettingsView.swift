//
//  SettingsView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import SwiftUI

struct SettingsView: View {
    let viewModel: SettingsViewModel

    var body: some View {
        ZStack {
            BackgroundImage(name: Images.Backgrounds.onboarding)
            List {
                Section {
                    ForEach(viewModel.items) {
                        SettingsItemView(viewModel: $0)
                            .listRowSeparatorTint(.white)
                            .listRowBackground(Color.customGrey)
                            .alignmentGuide(.listRowSeparatorTrailing, computeValue: { d in
                                d[.trailing]
                            }
                            )
                    }
                } header: {
                    Text("Settings")
                        .font(.custom("Bebas Neue", size: 37))
                        .foregroundStyle(.white)
                        .padding(.bottom)
                        .listRowInsets(
                            .init(
                                top: 20,
                                leading: 0,
                                bottom: 0,
                                trailing: 0
                            )
                        )
                }
            }
            .scrollContentBackground(.hidden)
            .padding(.top, 20)
        }
    }
}

#Preview {
    SettingsView(
        viewModel: SettingsViewModel(
            onAction: { _ in }
        )
    )
}
