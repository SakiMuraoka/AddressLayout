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
    var isSelected: Bool
    var body: some View {
        VStack {
            if self.isSelected{
                Image(envelope.iconImageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 4))
                    .shadow(radius: 500)
            }else{
                Image(envelope.iconImageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 4))
                    .shadow(radius: 500)
            }
            Text(envelope.envelopeName)
                .font(.footnote)
        }
        .frame(maxWidth: 100, maxHeight: 100)
    }
}

struct EnvelopeTypeItem_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            EnvelopeTypeItem(envelope: envelopeData[0], isSelected: true)
            EnvelopeTypeItem(envelope: envelopeData[0], isSelected: false)
        }
        .previewLayout(.fixed(width: 120, height: 150))
    }
}
