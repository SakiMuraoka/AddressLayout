//
//  FilterView.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/12.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var lastname = ""
    @State private var firstname = ""
    @State private var isOrganization = true
    @State var showLogView = false
    @Binding var isPresent: Bool
    @ObservedObject var userName: ViewModel
    
    var body: some View {
        VStack{
            VStack {
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
                        TextField("宛名/name", text: $userName.name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                }
            }
                .frame(maxWidth: 300, maxHeight: 100)
            ZipInputView()
            AddressInputView()
            HStack{
                Spacer()
                Button(action: {
                    self.isPresent = false
                }) {
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
            .padding()
    }
}

final class ViewModel: ObservableObject {
    @Published var name = ""
}

struct BindingViewExamplePreviewContainer_2 : View {
     @State
     private var value = false

     var body: some View {
        FilterView(isPresent: $value, userName: ViewModel())
     }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        BindingViewExamplePreviewContainer_2()
    }
}
