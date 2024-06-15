//
//  CustomButtonView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 04.06.2024.
//

import SwiftUI

struct CustomButtonView: View {
    private let label: String
    private let image: String?
    private let action: () -> Void

    init(
        label: String,
        image: String? = nil,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.image = image
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 58)
                    .foregroundStyle(.customPink)
                
                HStack(spacing: .zero) {
                    Spacer()

                    Text(label)
                        .foregroundStyle(.white)
                        .font(.custom("Bebas Neue", size: 20))
                        .fontWeight(.heavy)

                    Spacer()

                    image.map {
                        Image(systemName: $0)
                            .foregroundStyle(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(.white)
                                    .opacity(0.2)
                            }
                            .padding(.trailing, 12)
                    }
                }
            }
        }
    }
}

#Preview {
    CustomButtonView(
        label: "START",
        image: "arrow.right",
        action: {
            print("The button was pressed.")
        }
    )
}
