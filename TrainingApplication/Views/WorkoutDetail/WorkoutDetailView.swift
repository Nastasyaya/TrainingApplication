//
//  WorkoutDetailView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import SwiftUI

struct WorkoutDetailView: View {
    let viewModel: WorkoutDetailViewModel

    var body: some View {
        ZStack {
            Color(.customDarkGrey)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                backgroundImage

                VStack(alignment: .leading, spacing: 0) {
                    Text(viewModel.content.title)
                        .font(
                            .custom("Bebas Neue", size: 44)
                        )
                        .foregroundStyle(.white)
                        .padding(.bottom, 12)
                    
                    tagsItemView
                    
                    ScrollView {
                        ForEach(viewModel.content.rows) {
                            ExercisesListRowView(viewModel: $0)
                                .padding(.bottom, 8)
                        }
                    }
                }
                .padding(.horizontal)
                .offset(y: -130)
            }
        }
        .backButton(onBack: viewModel.backTapped)
        .customNavigationTitle(title: "Set detail")
        .overlay(alignment: .bottom) {
            CustomButtonView(
                label: "Start training",
                image: "flame.fill",
                action: viewModel.startTapped
            )
            .padding(.horizontal)
        }
    }
    
    private var tagsItemView: some View {
        HStack(spacing: 10) {
            ForEach(viewModel.content.tags) {
                TagItemView(viewModel: $0)
                    .padding(10)
            }
        }
        .padding(.bottom, 32)
    }
    
    private var backgroundImage: some View {
        Image(.detail)
            .resizable()
            .frame(height: 196)
            .ignoresSafeArea()
    }
}
#Preview {
    WorkoutDetailView(
        viewModel: WorkoutDetailViewModel(
            set: .mock,
            onAction: {
                _ in
            }
        )
    )
}
