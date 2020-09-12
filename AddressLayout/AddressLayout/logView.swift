//
//  logView.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/08.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct logView: View {
    @State var searchText = ""
    @State var text = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: InputView()){
                        Image(systemName: "plus")
                    }
                    Text("新規")
                    TextField("検索", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        self.text = self.searchText
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                itemList(searchText: text)
            }
            .navigationBarTitle("履歴画面", displayMode: .inline)
            .padding()
        }
    }
    
}

struct logView_Previews: PreviewProvider {
    static var previews: some View {
        logView()
    }
}
