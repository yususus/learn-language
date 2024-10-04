//
//  CategoryView.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct CategoryView: View {
    var title: String
    
    var body: some View {
        Text("Selected Level: \(title)")
            .navigationTitle("\(title) Degree").navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CategoryView(title: "B1")
}
