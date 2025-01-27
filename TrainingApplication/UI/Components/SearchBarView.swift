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
        HStack {
            TextField(
                "Search...",
                text: $inputText
            )
            .padding(.leading)
            .autocorrectionDisabled()
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.customPink)
                    .frame(width: 42, height: 42)
                
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.white)
                    .font(.custom("SF PRO", size: 17))
            }
            .padding(4)
        }
        .background {
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(.white)
                .frame(height: 50)
        }
        .padding(.vertical, 24)
    }
}

#Preview {
    ZStack {
        Color.customGrey.ignoresSafeArea()
        SearchBarView(inputText: .constant(""))
            .padding()
    }
}
