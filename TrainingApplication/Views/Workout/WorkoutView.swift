//
//  WorkoutView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 09.06.2024.
//

import SwiftUI

struct WorkoutView: View {
    @StateObject var viewModel: WorkoutViewModel

    @FocusState private var isFocused: Bool

    var body: some View {
            ZStack {
                BackgroundImage(name: Images.Backgrounds.onboarding)
                
                VStack {
                    header
                    
                    Spacer()
                    
                    sets
                }
            }
            .onAppear(perform: viewModel.onAppear)
            .onTapGesture {
                isFocused = false
            }
    }
    
    private var header: some View {
        ZStack(alignment: .leading) {
                            
                Image("Main")
                    .resizable()
                    .frame(height: 196)
                    .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                Text("Hello, Champion 👋🏼")
                    .font(.custom("Bebas Neue", size: 28))
                    .foregroundStyle(.white)
                SearchBarView(inputText: $viewModel.inputSearchText)
                    .focused($isFocused)
            }
            .padding(.horizontal)
        }
    }
                       
    private var sets: some View {
        ScrollView {
            HStack {
                Text("Generated sets")
                    .font(.custom("Bebas Neue", size: 24))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button(action: viewModel.viewAllTapped) {
                    Text("View all")
                    
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.customPink)
            }
            .padding()

            VStack(spacing: 12) {
                ForEach(viewModel.navigationItems) {
                    NavigationItemView(viewModel: $0)
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    WorkoutView(
        viewModel: WorkoutViewModel(
            contentConverter: WorkoutViewModel.ContentConverter(),
            service: GeneratedSetsService(),
            onAction: { _ in }
        )
    )
}
