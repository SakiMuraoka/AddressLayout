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
    @ObservedObject private var envelopeTypeViewModel: EnvelopeTypeViewModel = .init()

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
                        ActualSizeEnvelopeView(envelopeTypeViewModel: self.envelopeTypeViewModel).opacity(self.isActualDisplay ? 1.0 : 0.0)
                            
                        InputView(address: testLogData[0].sender.address).opacity(self.isActualDisplay ? 0.0 : 1.0)
                    }
// MARK: - 封筒サイズ変更ボタンと共有ボタン
                    HStack{

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
