//
//  Envelope.swift
//  AddressLayout
//
//  Created by Yuta Takayama on 2020/09/11.
//  Copyright © 2020 村岡沙紀. All rights reserved.
//

import SwiftUI

struct Envelope: Hashable, Codable, Identifiable {
    var id: Int
    var envelopeName: String
    var iconImageName: String
    var previewImageName: String
    var previewReverseImageName: String
}
