//
//  NextButtonView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//

import SwiftUI

struct NextButtonView: View {
    let nextExercise: String = "Pressure passing"
    
    var body: some View {
        
        Button(
            action: {},
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.customGrey)
                        .frame(height: 64)
           
                    HStack {
                        Text("Next :")
                            .font(.custom("SF PRO", size: 17))
                            .foregroundStyle(.white)
                        
                        Text("\(nextExercise)")
                            .font(.custom("Bebas Neue", size: 20))
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Image(systemName: "play.fill")
                            .foregroundStyle(.white)
                            .opacity(0.5)
                    }
                    .padding()
                }
            }
        )
    }
}

#Preview {
    NextButtonView()
}
