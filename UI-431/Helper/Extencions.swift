//
//  Extencions.swift
//  UI-431
//
//  Created by nyannyan0328 on 2022/01/22.
//

import SwiftUI

extension View{
    
    func hLeading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .leading)
    }
    
    func hTrailing()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .trailing)
    }
    
    func hCenter()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .center)
    }
    
    func VTop()->some View{
        
        self
            .frame(maxHeight:.infinity,alignment: .top)
    }
    
    func VBottome()->some View{
        
        self
            .frame(maxHeight:.infinity,alignment: .bottom)
    }
}
