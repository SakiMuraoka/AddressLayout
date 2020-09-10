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
                    Picker("", selection: self.$isReverse){
                        Text("オモテ")
                        .tag(false)
                        Text("ウラ")
                        .tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: bodyView.size.width - 100)
                    Picker("", selection: self.$isActualDisplay){
                        Text("プレビュー表示")
                        .tag(false)
                        Text("原寸大")
                        .tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: bodyView.size.width - 100)
                    ZStack{
                        ZStack{
                            FrontEnvelopePreviewView().opacity(self.isReverse ? 0.0 : 1.0)
                            BackEnvelopePreviewView().opacity(self.isReverse ? 1.0 : 0.0)
                        }
                        .opacity(self.isActualDisplay ? 0.0 : 1.0)
                        ScrollView ([.horizontal, .vertical], showsIndicators: true){
                            // TODO: 本物の封筒データにする
                            Rectangle()
                                .fill(Color.init(red: 0.92, green: 0.60, blue: 0.32))
                                .frame(
                                    width:  326.0*12.0/2.54 ,
                                    height: 326.0*23.5/2.54
                                )
                                .opacity(self.isActualDisplay ? 1.0 : 0.0)
                        }
                    }
                    
                    Spacer()
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
