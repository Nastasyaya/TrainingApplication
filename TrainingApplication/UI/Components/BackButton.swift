//
//  BackButton.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import SwiftUI

extension View {
    func backButton(onBack: @escaping () -> Void) -> some View {
        self
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    TransporentButtonView(
                        image: "arrow.left",
                        action: onBack
                    )
                    .padding(.leading)
                }
            }
    }
}
