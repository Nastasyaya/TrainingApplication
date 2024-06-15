//
//  ResultView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//

import SwiftUI

struct ResultView: View {
    let onFinish: () -> Void

    var body: some View {
        ZStack {
            Color(.customGrey).ignoresSafeArea()
            
            VStack {
                ZStack {
                    Image(.result)
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("Workout compete!")
                            .font(.custom("SF Pro", size: 17))
                            .foregroundStyle(.customPink)
                        
                        Text("Pressure passing")
                            .font(.custom("Bebas Neue", size: 44))
                            .foregroundStyle(.white)
                            .padding(.bottom, 24)
                        
                        HStack(spacing: 66) {
                            TimeResultColumnView(title: "Time", subtitle: "21:06")
                            
                            TimeResultColumnView(title: "Exer", subtitle: "15/15")
                        }
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Detail of trening")
                        .font(.custom("Bebas Neue", size: 24))
                        .padding(.bottom, 24)
                        .foregroundStyle(.white)
                    
                    ResultRowView()
                    
                }
                .padding()
                
                Spacer()
                
                CustomButtonView(
                    label: "Complete",
                    image: "checkmark",
                    action: onFinish
                )
                .padding()
            }
        }
    }
}

#Preview {
    ResultView(onFinish: {})
}
