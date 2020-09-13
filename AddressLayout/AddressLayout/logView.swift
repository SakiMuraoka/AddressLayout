//
//  logView.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/08.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct logView: View {
    @ObservedObject var userName = ViewModel()
    
    @State var showLogView = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: InputView()){
                        Image(systemName: "plus")
                    }
                    Text("新規")
                    TextField("検索", text: $userName.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "magnifyingglass")
                    }
                    Button(action: {
                        self.showLogView.toggle()
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                        .sheet(isPresented: self.$showLogView) {
                        // SecondViewを表示
                        FilterView(isPresent: self.$showLogView, userName: self.userName)
                    }
                }
                itemList()
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
