//
//  CustomShape.swift
//  UI-431
//
//  Created by nyannyan0328 on 2022/01/22.
//

import SwiftUI

struct CustomShape: Shape {
    
    var radius : CGFloat
    var corners : UIRectCorner
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

