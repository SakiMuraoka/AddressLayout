//
//  ZipInputView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct ZipInputView: View {
    @State private var zipcode = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("郵便番号")
                Spacer()
            }
            HStack{
                TextField("XXX-XXXX", text: $zipcode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("住所自動入力")
                        .font(.callout)
                        .fontWeight(.heavy)
                        .padding(7)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
            }
        }
        .frame(maxWidth: 300, maxHeight: 80)
    }
}

struct ZipInputView_Previews: PreviewProvider {
    static var previews: some View {
        ZipInputView()
    }
}
