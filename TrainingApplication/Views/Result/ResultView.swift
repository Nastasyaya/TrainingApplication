//
//  ResultView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//

import SwiftUI

struct ResultView: View {
    let viewModel: ResultViewModel

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
                            
                            TimeResultColumnView(
                                title: "Exer",
                                subtitle: viewModel.content.exercisesCounter
                            )
                        }
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Detail of trening")
                        .font(.custom("Bebas Neue", size: 24))
                        .padding(.bottom, 24)
                        .foregroundStyle(.white)

                    ScrollView {
                        ForEach(viewModel.content.exerciesRows) {
                            ResultRowView(viewModel: $0)
                        }                        
                    }
                }
                .padding()
                
                Spacer()
                
                CustomButtonView(
                    label: "Complete",
                    image: "checkmark",
                    action: viewModel.completeTapped
                )
                .padding()
            }
        }
    }
}

#Preview {
    ResultView(
        viewModel: ResultViewModel(
            exercises: .init(
                allExercisesCount: 1,
                completedExercises: []
            ),
            onFinish: {}
        )
    )
}
