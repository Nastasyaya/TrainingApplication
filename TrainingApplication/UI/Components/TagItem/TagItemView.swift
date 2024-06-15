//
//  TagItemView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 05.06.2024.
//

import SwiftUI

struct TagItemView: View {
    private let viewModel: TagItemViewModel

    init(viewModel: TagItemViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: viewModel.image)
                .resizable()
                .frame(width: 11, height: 11)

            Text(viewModel.label)
                .font(.custom("SF Pro", size: 10))
        }
        .foregroundStyle(.white)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 73, height: 32)
                .foregroundStyle(.white)
                .opacity(0.1)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        TagItemView(
            viewModel: TagItemViewModel(
                label: "30 min.",
                image: "clock"
            )
        )
    }
}
