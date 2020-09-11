//
//  ActualSizeEnvelopeView.swift
//  AddressLayout
//
//  Created by Yuu Ichikawa on 2020/09/11.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct ActualSizeEnvelopeView: View {
    // ピクセルをメートルに直す式
    //端末の解像度(ppi) / 1インチ=2.54cm
    let envelopeGeometryMagnification: CGFloat = 326 / 2.54
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var parentRect: CGRect = .zero
    @State private var childRect: CGRect = .zero
    func correctPostion() {
        print(self.currentPosition)
        if self.currentPosition.width > 50 {
            self.currentPosition.width = 50
        }
        if self.currentPosition.height > 100 {
            self.currentPosition.height = 100
        }
        if self.currentPosition.width < -50 {
            self.currentPosition.width = -50
        }
        if self.currentPosition.height < -100 {
            self.currentPosition.height = -100
        }
    }
    var body: some View {
        GeometryReader { bodyView in
            ZStack(alignment: .topTrailing){
                Rectangle()
                    .fill(Color.init(red: 0.92, green: 0.60, blue: 0.32))
                    .frame(width: self.envelopeGeometryMagnification * 12.0,
                           height: self.envelopeGeometryMagnification * 23.5)
                    .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                        .onChanged { value in
                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                        }
                        .onEnded { value in
                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                            self.newPosition = self.currentPosition
                            print(self.currentPosition)
                        })
                    // TODO: 封筒サイズのマルチ対応（下のパラメータは長型風のもの）
                
                    
                VStack(alignment: .trailing) {
                        Text("305-0001")
                            .font(.system(size: self.envelopeGeometryMagnification * 0.8, weight: .black, design: .default))
                            .fontWeight(.medium)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.trailing)
                            .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                            .frame(width: self.envelopeGeometryMagnification * 5.0, height: self.envelopeGeometryMagnification * 0.8)
                            .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .padding([.top, .trailing], 10.0)
                }
            }.frame(width: bodyView.size.width-50 , height: bodyView.size.height)
             .clipped()
        }
    }
}

struct ActualSizeEnvelopeView_Previews: PreviewProvider {
    static var previews: some View {
         ForEach(["iPhone 11"], id: \.self) { deviceName in
//                   PreviewView(logData: testLogData[0])
//                       .previewDevice(PreviewDevice(rawValue: deviceName))
//                       .previewDisplayName(deviceName)
                    ActualSizeEnvelopeView()
               }
    }
}
