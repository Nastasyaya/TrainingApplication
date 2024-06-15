//
//  NavigationTitle.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import SwiftUI

extension View {
    func customNavigationTitle(title: String) -> some View {
        self
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.custom("SF Pro", size: 15))
                        .fontWeight(.semibold)
                }
            }
    }
}
