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
        VStack {
            header

            VStack(spacing: .zero) {
                
                sets
            }
            .ignoresSafeArea(.keyboard)
        }
        .background {
            Color.customDarkGrey
                .ignoresSafeArea()
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
                .scaledToFill()
                .ignoresSafeArea()
                .frame(height: 196)
            
            VStack(alignment: .leading) {
                Text("Hello, Champion 👋🏼")
                    .font(.custom("Bebas Neue", size: 28))
                    .foregroundStyle(.white)
                    .padding(.top, 24)
                
                SearchBarView(inputText: $viewModel.inputSearchText)
                    .focused($isFocused)
                    .padding(.bottom, 14)
                
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
            .padding(.vertical, 24)
            .padding(.horizontal)
            
            VStack(spacing: 12) {
                ForEach(viewModel.navigationItems.prefix(4)) {
                    NavigationItemView(viewModel: $0)
                }
            }
            .padding(.horizontal)
        }
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
