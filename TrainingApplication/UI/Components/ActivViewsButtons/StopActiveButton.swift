//
//  StopActiveButton.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//

import SwiftUI

struct StopActiveButton: View {
    @Binding var isTapped: Bool

    let action: () -> Void

    var body: some View {
        Button(
            action: action,
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.customPink), style: StrokeStyle(lineWidth: 1))
                    
                    Image(systemName: isTapped ? "play.fill" : "pause.fill")
                        .foregroundStyle(.white)
                }
                .frame(width: 54, height: 54)
                
            }
        )
    }
}

#Preview {
    ZStack {
        Color(.customGrey)
            .ignoresSafeArea()
        
        StopActiveButton(
            isTapped: .constant(false),
            action: {}
        )
    }
}
