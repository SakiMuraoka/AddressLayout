//
//  itemList.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/08.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct itemList: View {
    var addressTitle: String
    var envelopeType: String
    var body: some View {
        List {
            itemRow(addressTitle: addressTitle, envelopeType: envelopeType)
            itemRow(addressTitle: addressTitle, envelopeType: envelopeType)
            itemRow(addressTitle: addressTitle, envelopeType: envelopeType)
        }
    }
}

struct itemList_Previews: PreviewProvider {
    static var previews: some View {
        itemList(addressTitle: "筑波大学事務", envelopeType: "定型郵便用")
    }
}
