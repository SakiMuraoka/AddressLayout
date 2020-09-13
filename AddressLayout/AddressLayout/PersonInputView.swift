//
//  PersonInputView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct PersonInputView: View {
    @Binding var name: String
    @Binding var lastname: String
    @Binding var firstname: String
    @Binding var isOrganization: Bool
    
    var a = true
    var body: some View {
        VStack{
            HStack{
                Text("宛名")
                Spacer()
                Picker(selection: self.$isOrganization, label: Text("")){
                    Text("個人")
                        .tag(true)
                    Text("組織")
                        .tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 100)
            }
            HStack {
                if self.isOrganization {
                    TextField("姓/Last name", text: $lastname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("名/First name", text: $firstname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }else{
                    TextField("宛名/name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

            }
        }
        .frame(maxWidth: 300, maxHeight: 100)
        
    }
}

struct PersonInputView_Previews: PreviewProvider {
    static var previews: some View {
        PersonInputView(name: .constant(""), lastname: .constant(""), firstname: .constant(""), isOrganization: .constant(false))
            .previewLayout(.fixed(width: 350, height: 200))
    }
}
