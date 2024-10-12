//
//  QuestionView.swift
//  learn-language
//
//  Created by yusuf on 5.10.2024.
//

import SwiftUI

struct QuestionView: View {
    var title : String
    var level: String   // Seviye parametresi
    var category: String // Kategori parametresi

    var body: some View {
        VStack {
            HelpQuestion(level: level, category: category)
        }.navigationTitle(title)
    }
}

#Preview {
    QuestionView(title: "ads",level: "A1", category: "General")
}
