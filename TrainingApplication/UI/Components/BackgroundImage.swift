//
//  BackgroundImage.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 03.06.2024.
//

import SwiftUI

struct BackgroundImage: View {
    let name: String

    var body: some View {
        Image(name)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundImage(name: Images.Backgrounds.preloader)
}
