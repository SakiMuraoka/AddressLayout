//
//  Log.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct Log: Hashable, Codable, Identifiable {
    var id: Int
    var sender: Information
    var receiver: Information
    var envelopeTypeId: Int
    var dates: Dates
}

struct Information: Hashable, Codable {
    var address: Address
    var name: String
    var isOrganization: Bool
}

struct Dates: Hashable, Codable {
    var year: Int
    var month: Int
    var date: Int
}

struct Address: Hashable, Codable {
    var zipcode: String
    var prefecture: String
    var city: String
    var region: String
    var number1: Int
    var number2: Int
    var number3: Int
    var building: String
    var roomNumber: Int
}

struct Log_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
