//
//  EnvelopeDataViewModel.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/14.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

class EnvelopeDataViewModel: ObservableObject {
    @Published var envelope: EnvelopeData
    @Published var senderInformationVM: InformationViewModel = InformationViewModel()
    @Published var receiverInformationVM: InformationViewModel = InformationViewModel()
    
    init(){
        self.envelope = EnvelopeData()
        self.senderInformationVM.setup(information: self.envelope.sender ?? EnvelopeInformation())
        self.receiverInformationVM.setup(information: self.envelope.receiver ?? EnvelopeInformation())
    }
}
