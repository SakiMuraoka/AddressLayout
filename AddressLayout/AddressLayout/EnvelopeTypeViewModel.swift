//
//  EnvelopeTypeViewModel.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/12.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

let envelopeTypes: [Envelope] = envelopeData

final class EnvelopeTypeViewModel: ObservableObject {
    @Published private(set) var envelopes: [Envelope] = []
    @Published var selectedId: Int = 0
    
    init() {
        self.envelopes = envelopeTypes
        self.selectedId = 0
    }
    
    init(selectedId: Int){
        self.envelopes = envelopeTypes
        self.selectedId = selectedId
    }
    
    
    
}
