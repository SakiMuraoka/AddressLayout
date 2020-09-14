//
//  InformationViewModel.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/14.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

class InformationViewModel: ObservableObject {
    @Published var information: EnvelopeInformation = EnvelopeInformation()
    @Published var lastname: String = ""
    @Published var firstname: String = ""
    @Published var number1str: String?
    @Published var number2str: String?
    @Published var number3str: String?
    @Published var roomNumberstr: String?
    
    func setup(information: EnvelopeInformation) {
        self.information = information
        if !information.isOrganization{
            let nameList = self.information.name.components(separatedBy: ",")
            self.lastname = nameList[0]
            self.firstname = nameList[1]
        }
        self.number1str = self.information.address?.number1?.description ?? ""
        self.number2str = self.information.address?.number2?.description ?? ""
        self.number3str = self.information.address?.number3?.description ?? ""
        self.roomNumberstr = self.information.address?.roomNumber?.description ?? ""
    }
        
}
