//
//  AddressInputView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct AddressInputView: View {
    @Binding var prefecture: String
    @Binding var city: String
    @Binding var region: String
    @Binding var number1str: String
    @Binding var number2str: String
    @Binding var number3str: String
    @Binding var building: String
    @Binding var roomNumberstr: String
    
    
    var body: some View {
        VStack{
            HStack{
                Text("都道府県")
                Spacer()
            }
            TextField("", text: $prefecture)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack{
                Text("市区町村")
                Spacer()
            }
            TextField("", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack{
                Text("番地")
                Spacer()
            }
            TextField("", text: $region)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack{
                TextField("", text: $number1str)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                Text("丁目")
                TextField("", text: $number2str)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("番")
                TextField("", text: $number3str)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("号")
            }
            HStack{
                Text("アパート・マンション/部屋番号")
                Spacer()
            }
            HStack{
                TextField("", text: $building)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("", text: $roomNumberstr)
                    .frame(width: 50.0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    .frame(maxWidth: 300, maxHeight: 350)
    }
}

struct AddressInputView_Previews: PreviewProvider {
    static var previews: some View {
        AddressInputView(prefecture: .constant(""),
                         city: .constant(""),
                         region: .constant(""),
                         number1str: .constant(""),
                         number2str: .constant(""),
                         number3str: .constant(""),
                         building: .constant(""),
                         roomNumberstr: .constant(""))
    }
}
