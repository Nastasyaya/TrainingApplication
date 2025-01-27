//
//  TabBarView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 06.06.2024.
//

import SwiftUI

enum Tabs: Hashable {
    case workout
    case settings
}

struct TabBarView: View {
    // MARK: - PROPERTIES
    @Binding var selectedTab: Tabs

    @State private var workoutColor: Color = Color.customPink
    @State private var settingsColor: Color = Color.customLightGrey
    
    var body: some View {
        VStack(spacing: .zero) {
            Rectangle()
                .foregroundStyle(.white.opacity(0.2))
                .frame(height: 1)
            
            HStack(alignment: .center, spacing: 4) {
                workoutButton
                
                plusButton
                
                settingsButton
            }
            .background(Color.customGrey)
            .onChange(of: selectedTab) {
                switch selectedTab {
                case .workout:
                    workoutColor = Color.customPink
                    settingsColor = Color.customLightGrey
                case .settings:
                    workoutColor = Color.customLightGrey
                    settingsColor = Color.customPink
                }
            }
        }
        .frame(height: 91)
    }
    
    private var settingsButton: some View {
        Button(
            action: {
                selectedTab = .settings
            },
            label: {
                TabBarButton(
                    text: "Settings",
                    imageName: "person.fill",
                    color: settingsColor
                )
            }
        )
    }
    
    private var workoutButton: some View {
        Button(
            action: {
                selectedTab = .workout
            },
            label: {
                TabBarButton(
                    text: "Workout",
                    imageName: "football.fill",
                    color: workoutColor
                )
            }
        )
    }
    
    private var plusButton: some View {
        Button(
            action: {},
            label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
            }
        )
        .tint(Color.customPink)
    }
}


#Preview {
    @Previewable @State var selectedTab: Tabs = .workout
    
    return TabBarView(selectedTab: $selectedTab)
}
