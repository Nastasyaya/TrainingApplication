//
//  PreloaderView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 03.06.2024.
//

import SwiftUI

struct PreloaderView: View {
    var body: some View {
        ZStack {
            BackgroundImage(
                name: Images.Backgrounds.preloader
            )

            Spinner()
        }
    }
}

#Preview {
    PreloaderView()
}
