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
    @State var text = ""
    @ObservedObject var envelopeData = logViewModel()
    @ObservedObject var filterData = filterViewModel()
    @ObservedObject var currentEnvelopeData: EnvelopeDataViewModel = EnvelopeDataViewModel()
    @State var showLogView = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: InputView(information: currentEnvelopeData.receiverInformationVM)){
                        Image(systemName: "plus")
                    }
                    Text("新規")
                    TextField("検索", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        self.filterData.searchText = self.text
                        print("searchText:" + self.filterData.searchText)
                        print("name:" + self.filterData.name)
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    Button(action: {
                        self.showLogView.toggle()
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                        .sheet(isPresented: self.$showLogView) {
                        // SecondViewを表示
                        FilterView(isPresent: self.$showLogView, filterData: self.filterData)
                    }
                }
                itemList(filterData: self.filterData, envelopeData: envelopeData, currentEnvelopeData: currentEnvelopeData)
            }
            .navigationBarTitle("履歴画面", displayMode: .inline)
            .padding()
        }
    }    
}

final class filterViewModel: ObservableObject {
    @Published var name = ""
    @Published var lastname = ""
    @Published var firstname = ""
    @Published var zipcode = ""
    @Published var prefecture = ""
    @Published var city = ""
    @Published var region = ""
    @Published var number1str = ""
    @Published var number2str = ""
    @Published var number3str = ""
    @Published var building = ""
    @Published var roomNumberstr = ""
    @Published var isOrganization = true
    @Published var searchText = ""
}

class logViewModel: ObservableObject {
    @Published var EnvelopeDataModel: [EnvelopeData] = (try? Realm().objects(EnvelopeData.self).map { $0 }) ?? []
}

struct logView_Previews: PreviewProvider {
    static var previews: some View {
        logView()
    }
}
