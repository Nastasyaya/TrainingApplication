//
//  CustomModifires.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//
import SwiftUI

struct RoundedCorner: Shape {
    let radius: CGFloat = 12
    let corners: UIRectCorner = [.topRight, .bottomRight]
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius
            )
        )
        return Path(path.cgPath)
    }
    
}

struct SingleBorder: ViewModifier {
    let width: CGFloat
    let color: Color
    let sides: [Edge]
    
    func body(content: Content) -> some View {
        content
            .overlay(
                VStack(spacing: .zero) {
                    if sides.contains(.top) {
                        Rectangle()
                            .fill(color)
                            .frame(height: width)
                    }
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        HStack(spacing: .zero) {
                            if sides.contains(.leading) {
                                Rectangle()
                                    .fill(color)
                                    .frame(width: width)
                            }
                            
                            Spacer()
                        }
                    )
            )
    }
}

extension View {
    func border(width: CGFloat, color: Color, sides: [Edge]) -> some View {
        self.modifier(SingleBorder(width: width, color: color, sides: sides))
    }
}

