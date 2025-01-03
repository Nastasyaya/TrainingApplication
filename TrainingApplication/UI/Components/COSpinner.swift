//
//  COSpinner.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 16.06.2024.
//

import SwiftUI

struct COSpinner: View {
    @State private var degree = 270
    var count: Int = 8
    
    var body: some View {
        GeometryReader { bounds in
            ForEach(0..<count, id: \.self) { i in
                Circle()
                    .fill(.white)
                    .frame(width: getDotSize(i), height: getDotSize(i), alignment: .center)
                    .offset(x: (bounds.size.width / 2) - 30)
                    .rotationEffect(.degrees(.pi * 2 * Double(i * 5)))
            }
            .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)
            .rotationEffect(.degrees(Double(degree)))
            .animation(
                Animation.linear(duration: 1.5)
                    .repeatForever(autoreverses: false),
                value: degree
            )
            .onAppear{
                degree = 270 + 360
            }
        }
        .frame(width: 90, height: 90)
    }
    
    private func getDotSize(_ index: Int) -> CGFloat {
        CGFloat(index)
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        COSpinner()
    }
}
