//
//  SplashView.swift
//  learn-language
//
//  Created by yusuf on 18.10.2024.
//

import SwiftUI

struct SplashView: View {
    @State private var rotation = 180.0  // Başlangıç rotasyonu 360 derece
        @State private var isActive = false
        @State private var scale: CGFloat = 0.1  // Başlangıç ölçeği küçük
        
        var body: some View {
            if isActive {
                MainView()
            } else {
                ZStack {
                    Color(red: 1.0, green: 0.96, blue: 0.9)
                        .edgesIgnoringSafeArea(.all)
                    
                    ZStack {
                        Circle()
                            .stroke(Color(red: 0.9, green: 0.3, blue: 0.3), lineWidth: 3)
                            .frame(width: Const.width * 0.75, height: Const.height * 0.75)
                        
                        
                        
                        Text("W E L C O M E").font(Font.custom("FugazOne-Regular", size: 30))
                            
                            .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.3))
                    }
                    .scaleEffect(scale)
                    .rotation3DEffect(
                        .degrees(rotation),
                        axis: (x: 0, y: 1, z: 0),
                        anchor: .center,
                        perspective: 0.5
                    )
                }
                .onAppear {
                    withAnimation(
                        Animation
                            .easeOut(duration: 2)
                    ) {
                        rotation = 0  // 0 dereceye dön
                        scale = 1.0  // Tam boyuta büyü
                    }
                    
                    // Ana sayfaya geçiş
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }

#Preview {
    SplashView()
}
