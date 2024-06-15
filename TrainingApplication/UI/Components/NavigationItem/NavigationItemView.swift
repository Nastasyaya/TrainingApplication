//
//  NavigationItemView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 05.06.2024.
//

import SwiftUI

struct NavigationItemView: View {
    private let viewModel: NavigationItemViewModel

    init(viewModel: NavigationItemViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Button(action: viewModel.action) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.customGrey)

                HStack(spacing: .zero) {
                    Image(viewModel.leftImage)
                        .resizable()
                        .frame(width: 65, height: 65)
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.label)
                            .font(.custom("Bebas Neue", size: 20))
                            .foregroundStyle(.white)
                        
                        HStack(spacing: 10) {
                            ForEach(viewModel.tags) {
                                TagItemView(viewModel: $0)
                                    .padding(10)
                            }
                        }
                    }
                    .padding(.leading, 12)

                    Spacer()

                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.white)
                        .opacity(0.2)
                        .padding(.trailing, 20)
                }
                .padding(.leading, 12)
            }
            .frame(height: 89)
        }
    }
}

#Preview {
    NavigationItemView(
        viewModel: NavigationItemViewModel(
            leftImage: Images.Backgrounds.detail,
            label: "generated set 1",
            tags: [
                TagItemViewModel(label: "30 min.", image: "clock"),
                TagItemViewModel(label: "15 exer.", image: "clock")
            ],
            action: {
                print("Show detail")
            }
        )
    )
}
