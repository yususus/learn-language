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

    var body: some View {
        if isActive {
            MainView()
        } else {
            ZStack {
                Color(red: 1.0, green: 0.96, blue: 0.9)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("W E L C O M E")
                        .font(Font.custom("FugazOne-Regular", size: 40))
                        .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.3))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.bottom, 50)

                    Text("Learning a new word every day opens doors to new opportunities.")
                        .font(Font.custom("FugazOne-Regular", size: 25))
                        .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.3))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.bottom, 50)
                    
                    // Yükleme Çubuğu
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: Const.width * 0.75, height: 10)
                            .clipShape(.rect(cornerRadius: 10))
                        
                        Rectangle()
                            .fill(Color(red: 0.9, green: 0.3, blue: 0.3))
                            .frame(width: progressWidth, height: 10)
                            .clipShape(.rect(cornerRadius: 10))
                            .animation(.easeOut(duration: 2), value: progressWidth)
                    }
                    .padding(.bottom, 50)
                    
                    if showStartButton {
                        Button(action: {
                            withAnimation {
                                isActive = true
                            }
                        }) {
                            Text("Start")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0.9, green: 0.3, blue: 0.3))
                                .cornerRadius(10)
                        }
                        .transition(.opacity)
                    }
                }
            }
            .onAppear {
                withAnimation(.easeOut(duration: 2)) {
                    progressWidth = Const.width * 0.75
                    //çubuğu tamamlıyor gideceği yol kadar
                }
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
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
