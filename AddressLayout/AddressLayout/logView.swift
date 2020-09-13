//
//  logView.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/08.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI
import RealmSwift

struct logView: View {
    @ObservedObject var envelopeData = logViewModel()
    @State var searchWord :String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: InputView(address: testLogData[0].sender.address)){
                        Image(systemName: "plus")
                    }
                    Text("新規")
                    TextField("検索", text: $searchWord)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                itemList(envelopeData: envelopeData, searchText: searchWord)
//                List{
//                    ForEach(envelopeData.EnvelopeDataModel, id: \.id){ envdata in
//                        itemRow(LogData: Log(id: \.id, sender: \.envdata.sender, receiver: \.envdata.receiver, envelopeTypeId: \.envdata.envelopetypeId, dates: \.envdata.dates, isOrganization: \.envdata.isOrganization
//                        ))
//                        
//                    }
//                }
            }
            .navigationBarTitle("履歴画面", displayMode: .inline)
            .padding()
        }
    }
    
}

class logViewModel: ObservableObject {
    @Published var EnvelopeDataModel: [EnvelopeData] = (try? Realm().objects(EnvelopeData.self).map { $0 }) ?? []
}

struct logView_Previews: PreviewProvider {
    static var previews: some View {
        logView()
    }
}
