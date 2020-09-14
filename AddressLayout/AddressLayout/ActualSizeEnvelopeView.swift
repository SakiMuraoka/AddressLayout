//
//  ActualSizeEnvelopeView.swift
//  AddressLayout
//
//  Created by Yuu Ichikawa on 2020/09/11.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI
import UIKit
import CoreText


struct ActualSizeEnvelopeView: View {
    @ObservedObject var envelopeTypeViewModel: EnvelopeTypeViewModel
    
    var body: some View {
        Group {
            if envelopeTypeViewModel.selectedId == 0 {
                Kaku3EnvelopeView(envelopeTypeViewModel: envelopeTypeViewModel)
            }
            else if envelopeTypeViewModel.selectedId == 1 {
                Naga3EnvelopeView(envelopeTypeViewModel: envelopeTypeViewModel)
            }
            else if envelopeTypeViewModel.selectedId == 2{
                Naga40EnvelopeView(envelopeTypeViewModel: envelopeTypeViewModel)
            }
        }
    }
}

struct ActualSizeEnvelopeView_Previews: PreviewProvider {
    static var previews: some View {
        ActualSizeEnvelopeView(envelopeTypeViewModel: EnvelopeTypeViewModel.init(selectedId: 2))
    }
}
