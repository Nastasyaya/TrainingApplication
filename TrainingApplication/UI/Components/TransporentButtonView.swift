//
//  TransporentButtonView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 04.06.2024.
//

import SwiftUI

struct TransporentButtonView: View {
    private let image: String
    private let action: () -> Void
    
    init(
        image: String,
        action: @escaping () -> Void
    ) {
        self.image = image
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Image(systemName: image)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 44, height: 44)
                        .opacity(0.1)
                }
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        TransporentButtonView(
            image: "xmark",
            action: {
                print("The button was pressed.")
            }
        )
    }
}
