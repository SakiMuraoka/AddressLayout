//
//  InputView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/11.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct InputView: View {
    var body: some View {
        VStack{
            PersonInputView()
            ZipInputView()
            AddressInputView()
            HStack{
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("完了")
                        .font(.callout)
                        .fontWeight(.heavy)
                        .padding(7)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .padding(.trailing, 40.0)
            }
            Spacer()
        }
        .navigationBarTitle("入力画面", displayMode: .inline)
        .padding()    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
