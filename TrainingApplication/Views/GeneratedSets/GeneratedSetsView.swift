//
//  GeneratedSetsView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 12.06.2024.
//

import SwiftUI

struct GeneratedSetsView: View {
    @Environment(\.presentationMode) var presentationMode

    let viewModel: GeneratedSetsViewModel
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                BackgroundImage(name: Images.Backgrounds.onboarding)
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
            }

            VStack {
                customNavigation
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        ForEach(viewModel.navigationItems) {
                            NavigationItemView(viewModel: $0)
                        }
                    }
                    .padding(
                        EdgeInsets(
                            top: 16,
                            leading: 16,
                            bottom: 35,
                            trailing: 16
                        )
                    )
                }
            }
        }
        .toolbar(.hidden)
        .gesture(
            DragGesture()
                .onChanged { value in
                    if value.translation.width > 100 {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
        )
    }
    
    private var customNavigation: some View {
        HStack {
            TransporentButtonView(
                image: "arrow.left",
                action: viewModel.backTapped
            )
            .padding(.horizontal, 16)
            Spacer()
        }
        .overlay {
            HStack {
                Spacer()
                Text("Generated sets")
                    .foregroundStyle(.white)
                    .font(.custom("SF Pro", size: 15))
                    .fontWeight(.semibold)
                
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    GeneratedSetsView(
        viewModel: GeneratedSetsViewModel(
            contentConverter: GeneratedSetsViewModel.ContentConverter(),
            sets: [],
            onAction: { _ in }
        )
    )
}
