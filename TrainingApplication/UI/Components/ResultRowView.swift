//
//  ResultRowView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//

import SwiftUI

struct ResultRowView: View {
    var body: some View {
        HStack(spacing: 4) {
            Text("Exercises 1")
                .font(.custom("Bebas Neue", size: 20))
            
            Spacer()
            
            Text("3.06")
                .font(.custom("Bebas Neue", size: 17))
                
            Text("min.")
                .font(.custom("SF PRO", size: 12))
                .opacity(0.5)
        }
        .foregroundStyle(.white)
    }
    
    
}

#Preview {
    ZStack {
        Color(.customGrey)
            .ignoresSafeArea()
        ResultRowView()
    }
}
