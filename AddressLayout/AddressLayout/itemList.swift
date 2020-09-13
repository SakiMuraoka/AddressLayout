//
//  itemList.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/08.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct itemList: View {
    var searchText: String
    var body: some View {
        List {
            ForEach(testLogData) {LogData in
                if(self.searchText == "" || (LogData.sender.address.prefecture + LogData.sender.address.city + LogData.sender.address.region).contains(self.searchText) || (LogData.receiver.address.prefecture + LogData.receiver.address.city + LogData.receiver.address.region).contains(self.searchText) || (LogData.sender.name).contains(self.searchText) || (LogData.receiver.name).contains(self.searchText)){
                    NavigationLink(destination: PreviewView(logData: LogData)) {itemRow(LogData: LogData)
                    }
                }
            }
        }
    }
}

struct itemList_Previews: PreviewProvider {
    static var previews: some View {
        itemList(searchText: "茨城")
    }
}

