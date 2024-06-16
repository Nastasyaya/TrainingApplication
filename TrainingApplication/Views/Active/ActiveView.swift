//
//  ActiveView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//

import SwiftUI

struct ActiveView: View {
    @StateObject var viewModel: ActiveViewModel

    var body: some View {
        ZStack{
            BackgroundImage(name: Images.Backgrounds.onboarding)
            
            VStack {
                HStack(alignment: .firstTextBaseline, spacing: .zero) {
                    Text(viewModel.content.currentExerciesNumber)
                        .font(.custom("Bebas Neue", size: 28))
                    
                    Text("/" + viewModel.content.allExercisesCount)
                        .font(.custom("Bebas Neue", size: 16))
                    
                    Spacer()
                    
                    TransporentButtonView(
                        image: "xmark",
                        action: {
                            viewModel.showAlertTapped()
                        }
                    )
                    .padding()
                }
                
                HStack {
                    Text(viewModel.content.repeatingCount)
                        .opacity(0.5)
                    
                    Text(viewModel.content.exerciesName)
                }
                .font(.custom("Bebas Neue", size: 32))
                .padding(.bottom, 20)
                
                Text(viewModel.content.exerciesDescription)
                    .font(.custom("SF Pro", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 272, height: 42)
                
                VStack {
                    ZStack {
                        Image(.ring)
                        
                        Text(viewModel.currentTime)
                            .font(.custom("Bebas Neue", size: 64))
                    }
                    
                    NextExerciesInformationView(
                        nextExercise: viewModel.content.nextExerciesName
                    )
                }
                
                HStack {
                    StopActiveButton(
                        isTapped: $viewModel.isPauseTapped,
                        action: viewModel.timerButtonTapped
                    )
                    
                    Spacer()
                    
                    CustomButtonView(
                        label: viewModel.content.nextButtonTitle,
                        action: viewModel.nextExercies
                    )
                }
                .padding(.top, 78)
            }
            .foregroundStyle(.white)
            .padding()
        }
        .onAppear(perform: viewModel.onAppear)
        .alert(
            "Are you sure you want to finish the workout?",
            isPresented: $viewModel.isAlertShown
        ) {
            Button("Finish", role: .cancel) {
                viewModel.finishTapped()
            }
            
            Button("Cancel", role: .none) {
                viewModel.hideAlertTapped()
            }
        }
    }
}

#Preview {
    ActiveView(
        viewModel: ActiveViewModel(
            exercises: [],
            onFinish: {}
        )
    )
}
