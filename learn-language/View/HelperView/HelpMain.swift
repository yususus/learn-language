//
//  HelpMain.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct HelpMain: View {
    var title: String
    @EnvironmentObject var themeManager: ThemeManager
    
    var gradientColors: [Color] {
        switch title {
        case "A1":
            return themeManager.isDarkMode ? 
                [Color(hex: "#667eea"), Color(hex: "#764ba2")] :
                [Color(hex: "#f093fb"), Color(hex: "#f5576c")]
        case "A2":
            return themeManager.isDarkMode ?
                [Color(hex: "#f093fb"), Color(hex: "#f5576c")] :
                [Color(hex: "#4facfe"), Color(hex: "#00f2fe")]
        case "B1":
            return themeManager.isDarkMode ?
                [Color(hex: "#43e97b"), Color(hex: "#38f9d7")] :
                [Color(hex: "#fa709a"), Color(hex: "#fee140")]
        case "B2":
            return themeManager.isDarkMode ?
                [Color(hex: "#fa709a"), Color(hex: "#fee140")] :
                [Color(hex: "#30cfd0"), Color(hex: "#330867")]
        default:
            return [Color.blue, Color.purple]
        }
    }
    
    var levelIcon: String {
        switch title {
        case "A1": return "1.circle.fill"
        case "A2": return "2.circle.fill"
        case "B1": return "3.circle.fill"
        case "B2": return "4.circle.fill"
        default: return "book.fill"
        }
    }
    
    var body: some View {
        ZStack {
            // Modern gradient background
            LinearGradient(
                colors: gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(20)
            
            // Content
            HStack(spacing: 16) {
                // Icon
                Image(systemName: levelIcon)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                
                // Level text
                VStack(alignment: .leading, spacing: 4) {
                    Text("Level")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text(title)
                        .font(Font.custom("FugazOne-Regular", size: 32))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 1)
                }
                
                Spacer()
                
                // Arrow indicator
                Image(systemName: "chevron.right")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .frame(width: Const.width * 0.85, height: Const.height * 0.12)
        .shadow(color: gradientColors[0].opacity(0.4), radius: 12, x: 0, y: 6)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    LinearGradient(
                        colors: [.white.opacity(0.3), .clear],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        )
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
    }
}

#Preview {
    HelpMain(title: "A1")
        .environmentObject(ThemeManager())
}
