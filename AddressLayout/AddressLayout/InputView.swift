//
//  InputView.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/11.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI
import RealmSwift

struct InputView: View {
    @State var prefecture: String = ""
    @State var city: String = ""
    @State var region: String = ""
    @State var number1str: String = ""
    @State var number2str: String = ""
    @State var number3str: String = ""
    @State var building: String = ""
    @State var roomNumberstr: String = ""
    
    @State var zipcode: String = ""
    
    @State var name: String = ""
    @State var lastname: String = ""
    @State var firstname: String = ""
    @State var isOrganization: Bool = true
    
    @State var address: Address
    
    var body: some View {
        VStack{
            PersonInputView(name: $name, lastname: $lastname, firstname: $firstname, isOrganization: $isOrganization)
            ZipInputView(zipcode: $zipcode)
            AddressInputView(prefecture: $prefecture, city: $city, region: $region, number1str: $number1str, number2str: $number2str, number3str: $number3str, building: $building, roomNumberstr: $roomNumberstr)
            HStack{
                Spacer()
                Button(action: {
                    let newEnvelopeAddress = EnvelopeAddress()
                    newEnvelopeAddress.zipcode    = self.zipcode
                    newEnvelopeAddress.prefecture = self.prefecture
                    newEnvelopeAddress.city       = self.city
                    newEnvelopeAddress.region     = self.region
                    newEnvelopeAddress.number1    = Int(self.number1str) ?? 0
                    newEnvelopeAddress.number2    = Int(self.number2str) ?? 0
                    newEnvelopeAddress.number3    = Int(self.number3str) ?? 0
                    newEnvelopeAddress.building   = self.building
                    newEnvelopeAddress.roomNumber = Int(self.roomNumberstr) ?? 0
                    
                    let newEnvelopeInfo = EnvelopeInformation()
                    newEnvelopeInfo.address = newEnvelopeAddress
                    newEnvelopeInfo.name    = self.name
                    
                    let newEnvelopeDate = EnvelopeDate()
                    newEnvelopeDate.date  = 14
                    newEnvelopeDate.month = 9
                    newEnvelopeDate.year  = 2020
                    
                    let newEnvelopeData = EnvelopeData()
                    newEnvelopeData.id               = 0
                    newEnvelopeData.receiver         = newEnvelopeInfo
                    newEnvelopeData.sender           = nil
                    newEnvelopeData.envelopeTypeId   = 0
                    newEnvelopeData.dates            = newEnvelopeDate
                    newEnvelopeData.isOrganization   = self.isOrganization
                    
                    let realm = try? Realm()
                    try? realm?.write{
                        realm?.add(newEnvelopeData)
                        print(newEnvelopeData)
                    }
                    
                    // デバッグ用
                    let results = realm?.objects(EnvelopeData.self)
                    print(results ?? "null")
                    print(newEnvelopeAddress.number1)
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

        .padding()    }

}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(address: testLogData[0].sender.address)
    }
}
