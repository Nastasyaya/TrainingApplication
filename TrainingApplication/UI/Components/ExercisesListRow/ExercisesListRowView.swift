//
//  ExercisesListRowView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import SwiftUI

struct ExercisesListRowView: View {
    private let viewModel: ExercisesListRowViewModel
    
    init(viewModel: ExercisesListRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(viewModel.label)
                    .font(.custom("Bebas Neue", size: 20))
                
                HStack {
                    Text("Recomended to repeat:")
                        .font(.custom("SF PRO", size: 12))
                        .opacity(0.5)
                    
                    Spacer()
                    
                    Text(viewModel.caption)
                        .font(.custom("Bebas Neue", size: 12))
                }
            }
            .foregroundStyle(.white)
            .padding()
        } //: ZStack
        .background(.customGrey)
        .clipShape(RoundedCorner())
        .border(width: 3, color: .customLightGrey, sides: [.leading])
        .frame(height: 70)
    }
}


#Preview {
    ExercisesListRowView(
        viewModel: ExercisesListRowViewModel(
            label: "Exercises 1",
            caption: "x12"
        )
    )
}
