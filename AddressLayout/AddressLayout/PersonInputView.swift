//
//  PersonInputView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct PersonInputView: View {
    @State private var name = ""
    @State private var lastname = ""
    @State private var firstname = ""
    @State private var isIndividual = true
    
    
    var a = true
    var body: some View {
        VStack{
            HStack{
                Text("宛名")
                Spacer()
                Picker(selection: self.$isIndividual, label: Text("")){
                    Text("個人")
                        .tag(true)
                    Text("組織")
                        .tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 100)
            }
            HStack {
                if self.isIndividual {
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
        PersonInputView()
            .previewLayout(.fixed(width: 350, height: 200))
    }
}
