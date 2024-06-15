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
                    Text("3")
                        .font(.custom("Bebas Neue", size: 28))
                    
                    Text("/10")
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
                    Text("X12")
                        .opacity(0.5)
                    
                    Text("Pressure Passing")
                }
                .font(.custom("Bebas Neue", size: 32))
                .padding(.bottom, 20)
                
                Text("Practice heading from crosses into the box, focusing on timing, direction, and power. Improves aerial ability and goal-scoring headers.")
                    .font(.custom("SF Pro", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 272)
                
                VStack {
                    ZStack {
                        Image(.ring)
                        
                        Text(viewModel.currentTime)
                            .font(.custom("Bebas Neue", size: 64))
                    }
                    
                    NextButtonView()
                }
                
                HStack {
                    StopActiveButton(
                        isTapped: $viewModel.isPauseTapped,
                        action: viewModel.timerButtonTapped
                    )
                    
                    Spacer()
                    
                    CustomButtonView(label: "next", action: {})
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
            onFinish: {}
        )
    )
}
