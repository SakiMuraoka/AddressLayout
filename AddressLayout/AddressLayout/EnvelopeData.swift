//
//  AddressItem.swift
//  AddressLayout
//
//  Created by Yuu Ichikawa on 2020/09/13.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//
import RealmSwift


class EnvelopeData: Object{
    dynamic var id: String = UUID().uuidString
    dynamic var sender: EnvelopeInformation?
    dynamic var receiver: EnvelopeInformation?
    dynamic var envelopeTypeId: Int = 0
    dynamic var dates: EnvelopeDate?

    
    static var realm = try! Realm()
}

class EnvelopeInformation: Object {
    dynamic var address: EnvelopeAddress? = EnvelopeAddress()
    dynamic var name: String = ""
    dynamic var isOrganization: Bool = true
}

class EnvelopeDate: Object {
    dynamic var year: Int = 0
    dynamic var month: Int = 0
    dynamic var date: Int = 0
}

class EnvelopeAddress: Object {
    dynamic var zipcode: String = ""
    dynamic var prefecture: String = ""
    dynamic var city: String = ""
    dynamic var region: String = ""
    dynamic var number1: Int?
    dynamic var number2: Int?
    dynamic var number3: Int?
    dynamic var building: String?
    dynamic var roomNumber: Int?
}
