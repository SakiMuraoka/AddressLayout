//
//  Kaku3EnvelopeView.swift
//  AddressLayout
//
//  Created by Yuu Ichikawa on 2020/09/14.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI
import UIKit
import CoreText

struct Kaku3EnvelopeView: View {
    @ObservedObject var envelopeTypeViewModel: EnvelopeTypeViewModel
    @ObservedObject var information: InformationViewModel
    
    var body: some View {
        GeometryReader { bodyView in
            ZStack(){
                GeometryReader { envelopeImage in
                    Image(self.envelopeTypeViewModel.envelopes[self.envelopeTypeViewModel.selectedId].previewImageName)
                        .resizable()
                        .scaledToFit()
                        
                        
                    VStack(alignment: .trailing) {
                        Text(self.information.information.address?.zipcode ?? "")
                            .font(.system(size:18, weight: .black, design: .default))
                            .fontWeight(.medium)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 120, height: 40)
                            .offset(x: 140 , y: 10)
                        HStack(alignment: .top) {
                            TategakiText(text: self.information.information.name
                                ,fontSize: 20
                            ).frame(width: 50.0)
                                .offset(x: 90 , y: 15)
                            TategakiText(text:
                                self.information.information.address?.building ?? ""
                                , fontSize: 15
                            ).frame(width:30.0)
                                .offset(x: 110 , y: 15)
                            TategakiText(text: self.getAddress(address: self.information.information.address ?? EnvelopeAddress())
                                ,fontSize: 15
                            ).frame(width: 30.0)
                            .offset(x: 110 , y: 15)
                        }
                        
                    }
                    .padding(.leading)
                }
                .padding([.leading, .bottom])
                
            }.padding()
                .frame(width: 325, height: 600)
        }
    }
    func getAddress(address: EnvelopeAddress) -> String {
        address.prefecture + address.city + address.region
    }
}

struct Kaku3EnvelopeView_Previews: PreviewProvider {
    static var previews: some View {
         ForEach(["iPhone 11"], id: \.self) { deviceName in
            Kaku3EnvelopeView(envelopeTypeViewModel: EnvelopeTypeViewModel.init(selectedId: 0), information: InformationViewModel())
               }
    }
}

private struct TategakiText: UIViewRepresentable {
    public var text: String?
    public var fontSize: CGFloat?

    public func makeUIView(context: Context) -> TategakiTextView {
        let uiView = TategakiTextView()
        uiView.isOpaque = false
        uiView.text = text
        uiView.fontSize = fontSize
        return uiView
    }

    public func updateUIView(_ uiView: TategakiTextView, context: Context) {
        uiView.text = text
        uiView.fontSize = fontSize
    }
}

private class TategakiTextView: UIView {
    public var text: String? = nil {
        didSet {
            ctFrame = nil
        }
    }
    private var ctFrame: CTFrame? = nil
    public var fontSize: CGFloat? = 0

    override public func draw(_ rect: CGRect) {
        guard let context:CGContext = UIGraphicsGetCurrentContext() else {
            return
        }
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -rect.height)

        let baseAttributes: [NSAttributedString.Key : Any] = [
            .verticalGlyphForm: true,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize ?? 20),
        ]
        let attributedText = NSMutableAttributedString(string: text ?? "", attributes: baseAttributes)
        let setter = CTFramesetterCreateWithAttributedString(attributedText)
        let path = CGPath(rect: rect, transform: nil)
        let frameAttrs = [
            kCTFrameProgressionAttributeName: CTFrameProgression.rightToLeft.rawValue,
        ]
        let ct = CTFramesetterCreateFrame(setter, CFRangeMake(0, 0), path, frameAttrs as CFDictionary)
        ctFrame = ct

        CTFrameDraw(ct, context)
    }
}

