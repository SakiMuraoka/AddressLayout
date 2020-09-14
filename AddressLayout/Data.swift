//
//  Data.swift
//  AddressLayout
//
//  Created by 村岡沙紀 on 2020/09/10.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

//let testLogData: [Log] = load("testLogData.json")
let envelopeData: [Envelope] = load("envelopeData.json")

//JSONを読み込むための関数
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


