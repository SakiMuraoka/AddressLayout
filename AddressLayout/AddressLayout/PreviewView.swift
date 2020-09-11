//
//  PreviewView.swift
//  AddressLayout
//
//  Created by Yuu Ichikawa on 2020/09/09.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct PreviewView: View {
    @State private var isReverse = false
    @State private var isActualDisplay = true
    var logData: Log
    var body: some View {

        GeometryReader { bodyView in
            //            NavigationLink(destination: nil)
                VStack(alignment: .center) {
// MARK: - セグメントコントローラーと編集ボタン
                    HStack{
                        Picker("", selection: self.$isReverse){
                                Text("オモテ")
                                .tag(false)
                                Text("ウラ")
                                .tag(true)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .frame(width: bodyView.size.width - 100)
                        Spacer()
                        Button(action: {
                            self.isActualDisplay = !self.isActualDisplay
                        }){
                            Image(systemName: "square.and.pencil")
                        }
                    }
                    .padding(.horizontal)
                    
// MARK: -　封筒の部分
                    ZStack{
                        GeometryReader { geometry in
                            ScrollView ([.horizontal, .vertical], showsIndicators: true){
                                ZStack(alignment: .topTrailing){
                                    Rectangle()
                                        .fill(Color.init(red: 0.92, green: 0.60, blue: 0.32))
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                        // TODO: 封筒サイズのマルチ対応（下のパラメータは長型風のもの）
                                        //幅の広い封筒サイズだと画面に収まらないので、画面のwidthとheightを比較して、画面サイズに合わせて動的に封筒の領域を変えている

                                }
                            }.frame(width: bodyView.size.width - 100, height: bodyView.size.height-200)
                             .opacity(self.isActualDisplay ? 1.0 : 0.0)
                            
                        }
                    }
                    
                    Spacer()
                    HStack{
// MARK: - 封筒サイズ変更ボタンと共有ボタン
                        Button(action: {
                            // TODO: 封筒のサイズ変更機能のViewと接続
                            print("Tapped.")
                        }) {
                            Image(systemName: "envelope")
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
                .padding(.top)
            }
            .navigationBarTitle(Text("プレビュー"), displayMode: .inline)

        }
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 11"], id: \.self) { deviceName in
            PreviewView(logData: testLogData[0])
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
