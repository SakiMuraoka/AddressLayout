//
//  envelopeView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct EnvelopeView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom, spacing: 25){
                ForEach(envelopeData) {envelope in
                    EnvelopeTypeItem(envelope: envelope)
                }
            }
        }
        .padding(.horizontal, 30.0)
    }
}

struct EnvelopeView_Previews: PreviewProvider {
    static var previews: some View {
        EnvelopeView()
    }
}
