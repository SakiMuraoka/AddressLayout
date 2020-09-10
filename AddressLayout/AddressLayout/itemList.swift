//
//  itemList.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/08.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct itemList: View {

    var body: some View {
        List {
            ForEach(testLogData) {LogData in
                itemRow(LogData: LogData)
            }
        }
    }
}

struct itemList_Previews: PreviewProvider {
    static var previews: some View {
        itemList()
    }
}
