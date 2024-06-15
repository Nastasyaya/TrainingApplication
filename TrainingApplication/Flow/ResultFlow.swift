//
//  ResultFlow.swift
//  TrainingApplication
//
//  Created by Анастасия Кутняхова on 15.06.2024.
//

import SwiftUI

struct ResultFlow: View {
    struct Dependencies {
        let onFinish: () -> Void
    }
    
    let dependencies: Dependencies

    var body: some View {
        ResultView(onFinish: dependencies.onFinish)
    }
}
