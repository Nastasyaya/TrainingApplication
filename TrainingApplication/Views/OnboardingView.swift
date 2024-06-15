//
//  OnboardingView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 04.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    let onContinue: () -> Void

    var body: some View {
        ZStack {
            BackgroundImage(name: Images.Backgrounds.onboarding)
            
            VStack {
                Image("player-1")
                    .resizable()
                    .scaledToFit()
                    .offset(x: -45, y: 10)
                
                VStack (alignment: .leading) {
                    Text("Unleash Your Potential")
                        .font(.custom("Bebas Neue", size: 64))
                        .foregroundStyle(Color.white)

                    Text("""
                    Dive into the world of American football training. Explore dynamic workouts designed to unlock your gridiron potential.
                    """)
                    .font(.custom("SF Pro Text", size: 15))
                    .foregroundStyle(Color.white)
                    .opacity(0.5)
                }
                .padding()

                CustomButtonView(
                    label: "START",
                    image: "arrow.right",
                    action: onContinue
                )
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingView(onContinue: {})
}
