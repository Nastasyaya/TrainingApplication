//
//  SearchBarView.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 08.06.2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var inputText: String

    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(.white)
                .frame(height: 50)

            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.customPink)
                    .frame(width: 42, height: 42)
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.white)
                    .font(.custom("SF PRO", size: 17))
            }
            .padding(.trailing, 4)

            TextField(
                "Search...",
                text: $inputText
            )
            .padding(.leading)
            .autocorrectionDisabled()
        }
    }
}

#Preview {
    ZStack {
        Color.customGrey.ignoresSafeArea()
        SearchBarView(inputText: .constant(""))
    }
}
