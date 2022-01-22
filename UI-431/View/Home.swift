//
//  Home.swift
//  UI-431
//
//  Created by nyannyan0328 on 2022/01/22.
//

import SwiftUI

struct Home: View {
    
    @State var colors : [ColorGrid] = [
        
        ColorGrid(hexValue: "#15654B", color: Color("Green")),
        ColorGrid(hexValue: "#DAA4FF", color: Color("Violet")),
        ColorGrid(hexValue: "#FFD90A", color: Color("Yellow")),
        ColorGrid(hexValue: "#FE9EC4", color: Color("Pink")),
        ColorGrid(hexValue: "#FB3272", color: Color("Orange")),
        ColorGrid(hexValue: "#4460EE", color: Color("Blue")),
    
    
    
    
    ]
    
    
    @State var selectedColor : Color = Color("Pink")
    
    @State var animations : [Bool] = Array(repeating: false, count: 5)
    
    
   @Namespace var animation
    var body: some View {
        VStack{
            
            
            HStack{
                
                
                Button {
                    
                    
                } label: {
                    
                    
                    Image(systemName: "chevron.left")
                        .font(.title.weight(.bold))
                        .foregroundColor(.white)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.orange)
                            .padding(-9)
                        
                        )
                }
                .hLeading()
                
                
                Button {
                    
                } label: {
                    
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .background(
                        
                            Circle()
                                .stroke(Color.red,lineWidth: 1)
                                .padding(-5)
                                
                        
                        
                        )
                }


            }
            .padding([.horizontal,.top])
            .padding(.bottom,5)
            
            
            GeometryReader{proxy in
                
                let maxY = proxy.frame(in: .global).maxY
                
                
                CreditCardView()
                    .rotation3DEffect(.init(degrees: animations[0] ? 0 : -360), axis: (x: 1, y: 0, z: 0), anchor: .center)
                    .offset(y: animations[0] ? 0 : -maxY)
                
            }
            .frame(height: 260)
            
            HStack{
                
              Text("Grid Color")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    .offset(x: animations[1] ? 0 : -370)
                
                
                
            }
            .padding(.bottom,10)
            
            GeometryReader{_ in
                
                ZStack{
                    
                    
                    Color.black.clipShape(CustomShape(radius: 30, corners: [.topLeft,.topRight]))
                        .frame(height: animations[2] ? nil : 0)
                        .VBottome()
                    
                    ZStack{
                        
                        
                        ForEach(colors){GridColor in
                            
                            if !GridColor.showText{
                                
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(GridColor.color)
                                    .frame(width: 150, height: animations[3] ? 60 : 150)
                                    .matchedGeometryEffect(id: GridColor.id, in: animation)
                                    .rotationEffect(.init(degrees: GridColor.rotateCards ? 0 : 360))
                            }
                            
                            
                        }
                        
                        
                    }
                    .overlay(
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("BG"))
                        .frame(width: 150, height: animations[3] ? 60 : 150)
                        .opacity(animations[3] ? 0 : 1)
                    
                    
                    )
                    .scaleEffect(animations[3] ? 1 : 2.5)
                    
                    
                }
                
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    
                    let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 2)
                    
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        
                        
                        ForEach(colors){GridColor in
                            
                            GridCardView(colorGrid: GridColor)
                            
                            
                            
                        }
                        
                        
                        
                    }
                    .padding(.top,60)
                    
                }
                .padding()
                
                
                
                    
            }
            .padding()
            
            
            
            
        }
        .VTop()
        .hCenter()
        .background(Color("BG"))
        .ignoresSafeArea(.container, edges: .bottom)
        .onAppear(perform: animatedScrreen)
    }
    
    
    @ViewBuilder
    func GridCardView(colorGrid : ColorGrid) -> some View{
        
        
        VStack{
            
            if colorGrid.addToGrid{
                
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(colorGrid.color)
                    .frame(width: 150, height: 60)
                    .matchedGeometryEffect(id: colorGrid.id, in: animation)
                    .hLeading()
                
                    .onAppear{
                    
                    
                        if let index = colors.firstIndex(where: { color in
                            
                            
                            return color.id == colorGrid.id
                        }){
                            
                            withAnimation{
                                
                                colors[index].showText = true
                                
                            }
                            
                            
                        }
                    
                    }
                    .onTapGesture {
                        
                        
                        withAnimation{
                            
                            selectedColor = colorGrid.color
                            
                        }
                    }
                
                
                
                
                
                
            }
            
            else{
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.clear)
                    .frame(width: 150, height: 60)
                
                
                
            }
            
            
            Text(colorGrid.hexValue)
                .font(.caption.weight(.bold))
                .foregroundColor(.white)
                .hLeading()
                .opacity(colorGrid.showText ? 1 : 0)
            
            
            
            
            
            
        }
        
        
        
    }
    
    
    func animatedScrreen(){
        
        withAnimation(.interactiveSpring(response: 1.6, dampingFraction: 0.9, blendDuration: 0.8)){
            
            
            animations[0] = true
        }
        
        withAnimation(.easeInOut(duration: 2)){
            
            animations[1] = true
            
        }
        
        withAnimation(.interactiveSpring(response: 1.6, dampingFraction: 0.9, blendDuration: 0.8)){
            
            
            animations[2] = true
        }
        
        withAnimation(.easeInOut(duration: 1)){
            
            animations[3] = true
            
        }
        
        for index in colors.indices{
            
            let delay : Double = (0.9 + Double(index) * 0.1)
            
            let backIndex = ((colors.count - 1) - index)
            
            
            withAnimation(.easeInOut.delay(delay)){
                
                
                colors[backIndex].rotateCards = true
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                
                
                colors[backIndex].addToGrid = true
            }
            
            
        }
        
        
        
    }
    
    @ViewBuilder
    func CreditCardView()->some View{
        
        ZStack{
            
            
            RoundedRectangle(cornerRadius: 20)
                .fill(selectedColor)
            
            HStack{
                
                
                ForEach(1...5,id:\.self){index in
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 5, height: 5)
                }
                
                Text("584")
                    .font(.subheadline.weight(.semibold))
                    .kerning(3)
                   
                
                
            }
            .padding([.horizontal,.top])
            .hLeading()
            .VTop()
            
            
            
            HStack(spacing:-10){
                
                
             
                    
                    Text("JACOB DEGROM")
                        .font(.custom("cubic", size: 15))
                        .hLeading()
                        .overlay(
                        
                        
                            Rectangle()
                                .fill(.black)
                                .frame(width: 180,height:2)
                                .offset(x: -80, y: 15)
                                
                            
                            ,alignment: .bottom
                       
                        
                        )
                    
                 
                
            
                
                
                
                ForEach(1...2,id:\.self){index in
                    
                    Circle()
                        .stroke(Color.white)
                        .frame(width: 30, height: 30)
                    
                    
                }
            }
            .padding()
            .padding(.bottom,5)
            
            
                .VBottome()
            
            
            Circle()
                .stroke(.white,lineWidth: 20)
                .offset(x: 120, y: -130)
                
            
            
        }
        .clipped()
        .padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
