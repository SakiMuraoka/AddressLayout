//
//  itemList.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/08.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct itemList: View {

    @ObservedObject var filterData: filterViewModel
    @ObservedObject var envelopeData: logViewModel
    var body: some View {
        List {
            ForEach(testLogData) {LogData in
                if(filter(text: self.filterData.searchText, LogData: LogData, filterData: self.filterData)){
                    NavigationLink(destination: PreviewView(logData: LogData)) {
                        itemRow(LogData: LogData)
                    }
                }
            }
        }
       
    }
}

func filter(text: String, LogData: Log, filterData: filterViewModel) -> Bool{
    var isHidden = true
    let senderAddress = LogData.sender.address.prefecture + LogData.sender.address.city + LogData.sender.address.region
    let receiverAddress = LogData.receiver.address.prefecture + LogData.receiver.address.city + LogData.receiver.address.region
    let senderNames = (LogData.sender.name).components(separatedBy: ",")
    let receiverNames = (LogData.receiver.name).components(separatedBy: ",")
    var senderName = ""
    var receiverName = ""
    for name in senderNames{
        senderName += name
    }
    for name in receiverNames{
        receiverName += name
    }
    if(text != "" && !senderAddress.contains(text) && !receiverAddress.contains(text) && !senderName.contains(text) && !receiverName.contains(text)){
        isHidden.toggle()
    }else{
        if(filterData.isOrganization){
            if(filterData.lastname != "" && filterData.lastname != receiverNames[0]){
                isHidden.toggle()
            }else if(filterData.firstname != "" && filterData.firstname != receiverNames[1]){
                isHidden.toggle()
            }
        }else{
            if(filterData.name != "" && filterData.name != receiverName){
                isHidden.toggle()
            }
        }
        if(isHidden){
            if(filterData.zipcode != "" && filterData.zipcode != LogData.receiver.address.zipcode){
                isHidden.toggle()
            }else{
                if(filterData.prefecture != "" && filterData.prefecture != LogData.receiver.address.prefecture){
                    isHidden.toggle()
                }else{
                    if(filterData.city != "" && filterData.city != LogData.receiver.address.city){
                        isHidden.toggle()
                    }else{
                        if(filterData.region != "" && filterData.region != LogData.receiver.address.region){
                            isHidden.toggle()
                        }else{
                            if(filterData.number1str != "" && Int(filterData.number1str) != LogData.receiver.address.number1){
                                isHidden.toggle()
                            }else{
                                if(filterData.number2str != "" && Int(filterData.number2str) != LogData.receiver.address.number2){
                                    isHidden.toggle()
                                }else{
                                    if(filterData.number3str != "" && Int(filterData.number3str) != LogData.receiver.address.number3){
                                        isHidden.toggle()
                                    }else{
                                        if(filterData.building != "" && filterData.building != LogData.receiver.address.building){
                                            isHidden.toggle()
                                        }else{
                                            if(filterData.roomNumberstr != "" && Int(filterData.roomNumberstr) != LogData.receiver.address.roomNumber){
                                            isHidden.toggle()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return isHidden
}

struct itemList_Previews: PreviewProvider {
    static var previews: some View {
        itemList(filterData: filterViewModel(), envelopeData: logViewModel())
    }
}

