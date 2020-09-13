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
    @State var showLogView = false
    @Binding var isPresent: Bool
    @ObservedObject var filterData: ViewModel
    
    var body: some View {
        VStack{
            VStack {
                HStack{
                    Text("宛名")
                    Spacer()
                    Picker(selection: $filterData.isOrganization, label: Text("")){
                        Text("個人")
                            .tag(true)
                        Text("組織")
                            .tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 100)
                }
                HStack {
                    if filterData.isOrganization {
                        TextField("姓/Last name", text: $filterData.lastname)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("名/First name", text: $filterData.firstname)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }else{
                        TextField("宛名/name", text: $filterData.name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                }
            }
                .frame(maxWidth: 300, maxHeight: 100)
            VStack{
                HStack{
                    Text("郵便番号")
                    Spacer()
                }
                HStack{
                    TextField("XXX-XXXX", text: $filterData.zipcode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .frame(maxWidth: 300, maxHeight: 80)
           VStack{
                HStack{
                    Text("都道府県")
                    Spacer()
                }
            TextField("", text: $filterData.prefecture)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack{
                    Text("市区町村")
                    Spacer()
                }
            TextField("", text: $filterData.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack{
                    Text("番地")
                    Spacer()
                }
            TextField("", text: $filterData.region)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack{
                    TextField("", text: $filterData.number1str)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("丁目")
                    TextField("", text: $filterData.number2str)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("番")
                    TextField("", text: $filterData.number3str)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("号")
                }
                HStack{
                    Text("アパート・マンション/部屋番号")
                    Spacer()
                }
                HStack{
                    TextField("", text: $filterData.building)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("", text: $filterData.roomNumberstr)
                        .frame(width: 50.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .frame(maxWidth: 300, maxHeight: 350)
            HStack{
                Spacer()
                Button(action: {
                    self.isPresent = false                }) {
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


struct BindingViewExamplePreviewContainer_2 : View {
     @State
     private var value = false

     var body: some View {
        FilterView(isPresent: $value, filterData: ViewModel())
     }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        BindingViewExamplePreviewContainer_2()
    }
}
