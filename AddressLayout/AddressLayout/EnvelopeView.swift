//
//  envelopeView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct EnvelopeView: View {
    @ObservedObject var envelopeViewModel: EnvelopeTypeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom, spacing: 25){
                
                ForEach(self.envelopeViewModel.envelopes) {envelope in
                    if self.envelopeViewModel.selectedId == envelope.id {
                        EnvelopeTypeItem(envelope: envelope, isSelected: true)
                        .onTapGesture {
                            self._envelopeViewModel.wrappedValue.selectedId = envelope.id
                        }
                    }else {
                        EnvelopeTypeItem(envelope: envelope, isSelected: false)
                        .onTapGesture {
                            self._envelopeViewModel.wrappedValue.selectedId = envelope.id
                        }
                    }
                }

            }
        }
        .padding(.horizontal, 30.0)
    }
}

struct EnvelopeView_Previews: PreviewProvider {
    static var previews: some View {
        EnvelopeView(envelopeViewModel: .init(selectedId: 1))
    }
}
