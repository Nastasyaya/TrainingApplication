//
//  TabBarButton.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 08.06.2024.
//

import SwiftUI

struct TabBarButton: View {
    let text: String
    let imageName: String
    let color: Color
    
    var body: some View {
        
        GeometryReader { geo in
            VStack(alignment: .center, spacing: 4) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Text(text)
                    .font(.custom(
                        "SF Pro", size: 10))
            }
            .foregroundStyle(color)
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

#Preview {
    TabBarButton(
        text: "Workout",
        imageName: "football.fill",
        color: .customPink
    )
}
