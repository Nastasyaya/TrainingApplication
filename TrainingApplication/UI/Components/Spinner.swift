//
//  Spinner.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 03.06.2024.
//

import SwiftUI

struct Spinner: View {
    @State private var angle: Double = 0
    
    private let images = ["image1", "image2", "image3", "image4"]
    
    var body: some View {
        ZStack {
            ForEach(0..<4) { index in
                Image(self.images[index])
                    .resizable()
                    .frame(width: 35, height: 35)
                    .offset(x: 0)
                    .rotationEffect(.degrees(self.angle + (Double(index) * 90)))
                    .opacity(self.getOpacity(for: index))
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 4).repeatForever(autoreverses: false)) {
                self.angle = 360
            }
        }
    }
    
    private func getOpacity(for index: Int) -> Double {
        let currentAngle = (self.angle + (Double(index) * 90)).truncatingRemainder(dividingBy: 360)
        switch currentAngle {
        case 0..<90, 270..<360:
            return 1.0
        default:
            return 0.5
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        Spinner()
    }
}
