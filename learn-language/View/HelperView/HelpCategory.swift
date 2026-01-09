//
//  HelpCategory.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct HelpCategory: View {
    var categoryTitle: String
    @EnvironmentObject var themeManager: ThemeManager
    
    var categoryIcon: String {
        switch categoryTitle {
        case "General": return "star.fill"
        case "Sport": return "figure.run"
        case "Science": return "atom"
        case "Family": return "house.fill"
        case "Education": return "graduationcap.fill"
        case "Life": return "heart.fill"
        default: return "book.fill"
        }
    }
    
    var gradientColors: [Color] {
        themeManager.isDarkMode ?
            [Color(hex: "#667eea"), Color(hex: "#764ba2")] :
            [Color(hex: "#4facfe"), Color(hex: "#00f2fe")]
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(20)
            
            HStack(spacing: 16) {
                Image(systemName: categoryIcon)
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                
                Text(categoryTitle)
                    .font(Font.custom("FugazOne-Regular", size: 28))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 1)
                
                Spacer()
                
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
                .stroke(.white.opacity(0.2), lineWidth: 1)
        )
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
    }
}

struct SentencesView: View {
    var categoryTitle: String
    @EnvironmentObject var themeManager: ThemeManager
    
    var categoryIcon: String {
        switch categoryTitle {
        case "General": return "star.fill"
        case "Sport": return "figure.run"
        case "Science": return "atom"
        case "Family": return "house.fill"
        case "Education": return "graduationcap.fill"
        case "Life": return "heart.fill"
        default: return "book.fill"
        }
    }
    
    var gradientColors: [Color] {
        switch categoryTitle {
        case "Sport":
            return themeManager.isDarkMode ?
                [Color(hex: "#f093fb"), Color(hex: "#f5576c")] :
                [Color(hex: "#fa709a"), Color(hex: "#fee140")]
        case "Science":
            return themeManager.isDarkMode ?
                [Color(hex: "#43e97b"), Color(hex: "#38f9d7")] :
                [Color(hex: "#30cfd0"), Color(hex: "#330867")]
        case "Family":
            return themeManager.isDarkMode ?
                [Color(hex: "#667eea"), Color(hex: "#764ba2")] :
                [Color(hex: "#f093fb"), Color(hex: "#f5576c")]
        case "Education":
            return themeManager.isDarkMode ?
                [Color(hex: "#fa709a"), Color(hex: "#fee140")] :
                [Color(hex: "#4facfe"), Color(hex: "#00f2fe")]
        case "Life":
            return themeManager.isDarkMode ?
                [Color(hex: "#30cfd0"), Color(hex: "#330867")] :
                [Color(hex: "#43e97b"), Color(hex: "#38f9d7")]
        default:
            return [Color.blue, Color.purple]
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(20)
            
            HStack(spacing: 16) {
                Image(systemName: categoryIcon)
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                
                Text(categoryTitle)
                    .font(Font.custom("FugazOne-Regular", size: 28))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 1)
                
                Spacer()
                
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
                .stroke(.white.opacity(0.2), lineWidth: 1)
        )
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
    }
}

#Preview {
    HelpCategory(categoryTitle: "Education")
        .environmentObject(ThemeManager())
}
