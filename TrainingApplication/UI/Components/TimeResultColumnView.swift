//
//  TimeResultColumnView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//

import Foundation
import SwiftUI

struct TimeResultColumnView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundStyle(.white)
                .opacity(0.5)
                .font(.custom("SF Pro", size: 12))
            
            Text(subtitle)
                .font(.custom("Bebas Neue", size: 32))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ZStack {
        Color(.customGrey)
            .ignoresSafeArea()
        
        TimeResultColumnView(title: "Time", subtitle: "21:06")
    }
}
