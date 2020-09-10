//
//  itemRow.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/08.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct itemRow: View {
    var LogData: Log
    var body: some View {
        HStack{
            Image("envelope")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(LogData.receiver.address.prefecture + LogData.receiver.address.city)
                    .font(.headline)
                HStack {
                    Text("封筒タイプ:")
                        .font(.subheadline)
                    Text(LogData.envelopeType)
                        .font(.subheadline)
                    Spacer()
                    Text(String(LogData.dates.month) + "月" + String(LogData.dates.date) + "日")
                }
            }
            Spacer()
        }
        
    }
}

struct itemRow_Previews: PreviewProvider {
    static var previews: some View {
        itemRow(LogData: testLogData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
