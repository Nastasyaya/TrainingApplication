//
//  GeneratedSetsView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//

import SwiftUI

struct GeneratedSetsView: View {
    let viewModel: GeneratedSetsViewModel

    var body: some View {
        ZStack {
            BackgroundImage(name: Images.Backgrounds.onboarding)

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(viewModel.navigationItems) {
                        NavigationItemView(viewModel: $0)
                    }
                }
                .offset(y: 92)
                .padding(.horizontal)
            }
        }
        .backButton(onBack: viewModel.backTapped)
        .customNavigationTitle(title: "Generated sets")
    }
}

#Preview {
    GeneratedSetsView(
        viewModel: GeneratedSetsViewModel(
            contentConverter: GeneratedSetsViewModel.ContentConverter(),
            sets: [],
            onAction: { _ in }
        )
    )
}
