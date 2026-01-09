//
//  SplashView.swift
//  learn-language
//
//  Created by yusuf on 18.10.2024.
//

import SwiftUI

struct SplashView: View {
    @State private var progressWidth: CGFloat = 0.0 
    @State private var isActive = false
    @State private var showStartButton = false
    @State private var scale: CGFloat = 0.8
    @State private var opacity: Double = 0.0

    var body: some View {
        if isActive {
            MainView()
                .environmentObject(ThemeManager())
        } else {
            ZStack {
                // Modern gradient background
                LinearGradient(
                    colors: [Color(hex: "#667eea"), Color(hex: "#764ba2")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    // App Icon/Logo
                    VStack(spacing: 20) {
                        Image(systemName: "book.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                            .scaleEffect(scale)
                        
                        Text("W E L C O M E")
                            .font(Font.custom("FugazOne-Regular", size: 42))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                            .opacity(opacity)
                    }
                    
                    // Quote
                    Text("Learning a new word every day opens doors to new opportunities.")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .opacity(opacity)
                    
                    // Progress Bar
                    VStack(spacing: 12) {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.3))
                                .frame(width: Const.width * 0.75, height: 8)
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .frame(width: progressWidth, height: 8)
                                .shadow(color: .white.opacity(0.5), radius: 5, x: 0, y: 0)
                                .animation(.spring(response: 0.6, dampingFraction: 0.8), value: progressWidth)
                        }
                        
                        Text("Loading...")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                            .opacity(opacity)
                    }
                    .padding(.bottom, 20)
                    
                    // Start Button
                    if showStartButton {
                        Button(action: {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                isActive = true
                            }
                        }) {
                            HStack(spacing: 12) {
                                Text("Get Started")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Image(systemName: "arrow.right")
                                    .font(.headline)
                            }
                            .foregroundColor(Color(hex: "#667eea"))
                            .padding(.horizontal, 40)
                            .padding(.vertical, 16)
                            .background(
                                Capsule()
                                    .fill(Color.white)
                                    .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 8)
                            )
                        }
                        .transition(.scale.combined(with: .opacity))
                        .padding(.bottom, 40)
                    }
                    
                    Spacer()
                }
            }
            .onAppear {
                // Animate logo
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                    scale = 1.0
                }
                
                // Animate text and progress
                withAnimation(.easeIn(duration: 0.5).delay(0.3)) {
                    opacity = 1.0
                }
                
                // Animate progress bar
                withAnimation(.easeOut(duration: 2).delay(0.5)) {
                    progressWidth = Const.width * 0.75
                }
                
                // Show start button
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                        showStartButton = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
