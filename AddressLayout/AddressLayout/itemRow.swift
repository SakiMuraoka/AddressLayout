//
//  itemRow.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/08.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct itemRow: View {
    var addressTitle: String
    var envelopeType: String
    var body: some View {
        HStack{
            Image("envelope")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(addressTitle)
                    .font(.headline)
                HStack {
                    Text("封筒タイプ:")
                        .font(.subheadline)
                    Text(envelopeType)
                        .font(.subheadline)
                }
            }
            Spacer()
        }
        
    }
}

struct itemRow_Previews: PreviewProvider {
    static var previews: some View {
        itemRow(addressTitle: "筑波大学事務", envelopeType: "定型郵便用")
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
