//
//  EnvelopeTypeItem.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct EnvelopeTypeItem: View {
    var envelope: Envelope
    var body: some View {
        VStack {
            Image(envelope.iconImageName)
                .resizable()
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 4))
                .shadow(radius: 500)
            Text(envelope.envelopeName)
                .font(.footnote)
        }
        .frame(maxWidth: 100, maxHeight: 100)
    }
}

struct EnvelopeTypeItem_Previews: PreviewProvider {
    static var previews: some View {
        EnvelopeTypeItem(envelope: envelopeData[0])
//        EnvelopeTypeItem(name: 1)
        .previewLayout(.fixed(width: 120, height: 150))
    }
}
