//
//  QuestionView.swift
//  learn-language
//
//  Created by yusuf on 5.10.2024.
//

import SwiftUI

struct QuestionView: View {
    var title : String
    var body: some View {
        VStack {
            HelpQuestion()
        }.navigationTitle(title)
    }
}

#Preview {
    QuestionView(title: "ads")
}
