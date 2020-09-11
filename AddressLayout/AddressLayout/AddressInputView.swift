//
//  AddressInputView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct AddressInputView: View {
    @State var prefecture: String = ""
    @State var city: String = ""
    @State var region: String = ""
    @State var number1str = ""
    @State var number2str = ""
    @State var number3str = ""
    @State var building: String = ""
    @State var roomNumberstr = ""
    
    
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
                Text("町")
                Spacer()
            }
            TextField("", text: $region)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack{
            TextField("", text: $number1str)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("丁目")
                TextField("", text: $number1str)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("番地")
                TextField("", text: $number1str)
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
        AddressInputView()
    }
}
