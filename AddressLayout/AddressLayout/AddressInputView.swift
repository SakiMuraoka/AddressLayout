//
//  AddressInputView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct AddressInputView: View {
    @State private var state = ""
    @State private var city = ""
    @State private var region = ""
    @State private var house = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("都道府県")
                Spacer()
            }
            TextField("", text: $state)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack{
                Text("市区町村")
                Spacer()
            }
            TextField("", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack{
                Text("町番地")
                Spacer()
            }
            TextField("", text: $region)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack{
                Text("アパート・マンション")
                Spacer()
            }
            TextField("", text: $house)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    .frame(maxWidth: 300, maxHeight: 300)
    }
}

struct AddressInputView_Previews: PreviewProvider {
    static var previews: some View {
        AddressInputView()
    }
}
