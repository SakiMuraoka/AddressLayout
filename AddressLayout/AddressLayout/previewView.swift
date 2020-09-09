//
//  PreviewView.swift
//  AddressLayout
//
//  Created by Yuu Ichikawa on 2020/09/09.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct PreviewView: View {
    var body: some View {
        NavigationView{
//            NavigationLink(destination: nil)
            VStack {
                HStack(alignment: .bottom){
                    Rectangle()
                        .fill(Color.init(red: 0.92, green: 0.60, blue: 0.32))
                        .frame(width: 214.8, height: 500.0)
        //            .shadow(radius: /*@START_MENU_TOKEN@*/20/*@END_MENU_TOKEN@*/)
                    VStack {
                        Button(action: {
                            print("Tapped.")
                        }) {
                            Text("表/裏")
                                .padding(.bottom, 20.0)
                        }
                        .buttonStyle(PlainButtonStyle())
                        Button(action: {
                            print("Tapped.")
                        }) {
                            Text("プレビュー\n/原寸大").lineLimit(nil)
                                .font(.caption)
                                .padding(.bottom)
                                .frame(width: 60.0, height: 60.0)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.leading, 70.0)
                Spacer()
                HStack{
                    
                    Button(action: {
                        print("Tapped.")
                    }) {
                        Text("封筒の種類")
                    }
                    Spacer()
                    Button(action: {
                        print("Tapped.")
                    }) {
                        Text("プリント")
                    }
                    .padding(.trailing, 20.0)
                }
                .padding(.all, 50.0)
            }
            .padding(.top)
            .navigationBarTitle(Text("プレビュー"), displayMode: .inline)
        }
        .padding()
        
    }
    
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
    }
}
