//
//  itemRow.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/08.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct itemRow: View {
    @State var LogData: EnvelopeData
    var body: some View {
        HStack{
            Image("envelope")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(self.getAddress(address: self.LogData.receiver?.address ?? EnvelopeAddress()))
                    .font(.headline)
                HStack {
                    Text("封筒タイプ:")
                        .font(.subheadline)
                    Text(String(LogData.envelopeTypeId))
                        .font(.subheadline)
                    Spacer()
                    Text(self.getDate(date: self.LogData.dates ?? EnvelopeDate()))
                        .font(.caption)
                }
            }
            Spacer()
        }
        
    }
    func getAddress(address: EnvelopeAddress) -> String {
        address.prefecture + address.city + address.region
    }
    func getDate(date: EnvelopeDate) -> String{
        String(date.month) + "月" + String(date.date) + "日"
    }
}

struct itemRow_Previews: PreviewProvider {
    static var previews: some View {
        itemRow(LogData: EnvelopeData())
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
