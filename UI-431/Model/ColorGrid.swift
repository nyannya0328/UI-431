//
//  ColorGrid.swift
//  UI-431
//
//  Created by nyannyan0328 on 2022/01/22.
//

import SwiftUI

struct ColorGrid: Identifiable {
    var id = UUID().uuidString
    var hexValue : String
    var color : Color
    var rotateCards : Bool = false
    var addToGrid : Bool = false
    var showText : Bool = false
    var removeFromView : Bool = false
}

