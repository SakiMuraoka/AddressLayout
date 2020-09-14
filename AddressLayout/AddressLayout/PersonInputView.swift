//
//  PersonInputView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct PersonInputView: View {
    
    @ObservedObject var information: InformationViewModel
    
    var a = true
    var body: some View {
        VStack{
            HStack{
                Text("宛名")
                Spacer()
                Picker(selection: self.$information.information.isOrganization, label: Text("")){
                    Text("個人")
                        .tag(false)
                    Text("組織")
                        .tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 100)
            }
            HStack {
                if self.information.information.isOrganization {
                    TextField("宛名/name", text: $information.information.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }else{
                    TextField("姓/Last name", text: $information.lastname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("名/First name", text: $information.firstname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
            }
        }
        .frame(maxWidth: 300, maxHeight: 100)
        
    }
}

struct PersonInputView_Previews: PreviewProvider {
    static var previews: some View {
        PersonInputView(information: EnvelopeDataViewModel().senderInformationVM)
            .previewLayout(.fixed(width: 350, height: 200))
    }
}
