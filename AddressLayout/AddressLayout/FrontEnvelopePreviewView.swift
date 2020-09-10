//
//  FrontEnvelopePreviewView.swift
//  AddressLayout
//
//  Created by Yuu Ichikawa on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct FrontEnvelopePreviewView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing){
            // FIXME: 本当はこういうことやりたい、直せたら直してほしい
//                            let envelopeWidth = geometry.size.height*0.5
//                            let envelopeHeight = geometry.size.height
            
                Rectangle()
                    .fill(Color.init(red: 0.92, green: 0.60, blue: 0.32))
                    // TODO: 封筒サイズのマルチ対応（下のパラメータは長型風のもの）
                    .frame(width: geometry.size.height*0.5, height: geometry.size.height )
                VStack(alignment: .trailing) {
                    Button(action: {
                        // TODO: 郵便番号の入力フォーム作る
                        print("Tapped.")
                    }) {
                        Text("郵便番号")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.trailing)
                    
                    }
                    .frame(width: geometry.size.height / 5)
                    .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding([.top, .trailing], 10.0)
                    
                    Spacer()
                    HStack(alignment: .bottom) {
                        Button(action: {
                            // TODO: 住所の入力フォーム作る、郵便番号の自動入力に対応する
                            print("Tapped.")
                        }) {
                            Text("宛名を入力")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(width: 30.0)
                        }
                        .frame(width: geometry.size.height / 8, height: (geometry.size.height - 80))
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .padding([.bottom, .trailing])
                        
                        Button(action: {
                            // TODO: 住所の入力フォーム作る、郵便番号の自動入力に対応する
                            print("Tapped.")
                        }) {
                            Text("住所を入力")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(width: 30.0)
                        }
                        .frame(width: geometry.size.height / 8, height: (geometry.size.height - 80))
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .padding([.bottom, .trailing])
                    }
                }
                .padding(.vertical, 10.0)
            }
        }
    }
}
