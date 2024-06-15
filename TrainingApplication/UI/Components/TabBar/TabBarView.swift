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
        HStack(alignment: .center, spacing: 4) {
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

            Button(
                action: {
                    // some action
                },
                label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                }
            )
            .tint(Color.customPink)
            
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
        .background(Color.customGrey)
        .frame(height: 91)
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
}


#Preview {
    @State var selectedTab: Tabs = .workout
    return TabBarView(selectedTab: $selectedTab)
}
