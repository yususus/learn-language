//
//  HelpQuestion.swift
//  learn-language
//
//  Created by yusuf on 8.10.2024.
//

import SwiftUI

struct HelpQuestion: View {
    var body: some View {
        VStack {
            VStack {
                Text("Sorular burada gözükecek").foregroundStyle(LinearGradient(colors: [.black.opacity(0.8), .black.opacity(0.65), ], startPoint: .top, endPoint: .bottomTrailing)).bold().font(.title3)
            }.frame(width: Const.width * 0.9, height: Const.height * 0.25).background(.brown.opacity(0.25)).cornerRadius(20)
            Spacer()
            VStack{
                Button {
                    
                } label: {
                    Text("seçenek1").foregroundStyle(.black.opacity(0.7)).fontWeight(.bold)
                    .frame(width: Const.width * 0.9, height: Const.height * 0.07).background(.brown.opacity(0.1)).cornerRadius(20).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 1)
                    )
                }
                Button {
                    
                } label: {
                    Text("seçenek2").foregroundStyle(.black.opacity(0.7)).fontWeight(.bold)
                    .frame(width: Const.width * 0.9, height: Const.height * 0.07).background(.brown.opacity(0.1)).cornerRadius(20).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 1)
                    )
                }
                Button {
                    
                } label: {
                    Text("seçenek3").foregroundStyle(.black.opacity(0.7)).fontWeight(.bold)
                    .frame(width: Const.width * 0.9, height: Const.height * 0.07).background(.brown.opacity(0.1)).cornerRadius(20).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 1)
                    )
                }
                Button {
                    
                } label: {
                    Text("seçenek4").foregroundStyle(.black.opacity(0.7)).fontWeight(.bold)
                        .frame(width: Const.width * 0.9, height: Const.height * 0.07).background(.brown.opacity(0.1)).cornerRadius(20).overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.black, lineWidth: 1)
                        )
                }

                
            }
            Spacer()
            Button {
                
            } label: {
                Text("Submit")
                    .foregroundStyle(LinearGradient(colors: [.black.opacity(0.65), .black.opacity(0.8), ], startPoint: .top, endPoint: .bottomTrailing)).fontWeight(.bold)
                    .frame(width: Const.width * 0.9, height: Const.height * 0.07).background(.brown.opacity(0.3)).cornerRadius(20)
            }

        }
    }
}

#Preview {
    HelpQuestion()
}
