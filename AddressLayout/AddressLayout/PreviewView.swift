//
//  PreviewView.swift
//  AddressLayout
//
//  Created by Yuu Ichikawa on 2020/09/09.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct PreviewView: View {
    @State private var isReverse = 0
    @State private var isActualDisplay = 0
    var body: some View {
        GeometryReader { bodyView in
            NavigationView {
            //            NavigationLink(destination: nil)
                VStack(alignment: .center) {
                    Picker("", selection: self.$isReverse){
                        Text("オモテ")
                        .tag(0)
                        Text("ウラ")
                        .tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: bodyView.size.width - 100)
                    Picker("", selection: self.$isActualDisplay){
                        Text("プレビュー表示")
                        .tag(0)
                        Text("原寸大")
                        .tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: bodyView.size.width - 100)
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
                        }
                        .padding(.vertical, 10.0)
                    }
                    Spacer()
                    HStack{
                        
                        Button(action: {
                            // TODO: 封筒のサイズ変更機能のViewと接続
                            print("Tapped.")
                        }) {
                            Image(systemName: "envelope.circle.fill")
                        }
                        .padding(.leading, 40.0)
                        Spacer()
                        Button(action: {
                            // TODO: プリント機能のViewと接続
                            print("Tapped.")
                        }) {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .padding(.trailing, 40.0)
                    }
                    .padding(.bottom, 30.0)
                }
                .padding(.top)
                .navigationBarTitle(Text("プレビュー"), displayMode: .inline)
            }
        }
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 11"], id: \.self) { deviceName in
            PreviewView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
