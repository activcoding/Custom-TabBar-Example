//
//  ContentView.swift
//  Custom-TabBar
//
//  Created by Tommy Ludwig on 20.08.22.
//

import SwiftUI

struct CustomTabBar: View {
    @State var fontsize: Double = UserDefaults.standard.double(forKey: "Size")
    @StateObject var viewRouter: ViewRouter
    @Binding var tabbar: Int
    var body: some View {
   
            GeometryReader{ geo in
                let width = geo.size.width
                let height = geo.size.height
                
                VStack{
                    switch viewRouter.currentPage{
                    case .home:
                        Text("Hello!")
                    case .view2:
                        Text("World!")
                    case .view3:
                        Text("Hello, World!")
                    }
                    Spacer()
                    
                    ZStack{
                        VStack{
                            HStack{
                                TabBarIcon(viewRouter: viewRouter, assignedpage: .home, width: width/5, height: height/28, systemIconName: "house", tabName: "Home")
                                    .padding(.leading)
                                Spacer()
                                TabBarIcon(viewRouter: viewRouter, assignedpage: .view2, width: width/6, height: height/28, systemIconName: "gearshape.2", tabName: "Modifiers")
                                Spacer()
                                TabBarIcon(viewRouter: viewRouter, assignedpage: .view3, width: width/5, height: height/28, systemIconName: "gearshape.fill", tabName: "Einstellungen")
                                    .padding(.trailing)
                            }.frame(width: width, height: height/8)
                        }
                      
                        
                    }.cornerRadius(20, corners: [.topLeft, .topRight])
                }.background(Color.black)
            }.edgesIgnoringSafeArea(.bottom)
        
    }
}

struct TabBarIcon: View{
    @StateObject var viewRouter: ViewRouter
    let assignedpage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View{
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            
            Text(tabName)
                .font(.caption)
    
            
            Spacer()
        }.padding(.horizontal, -4)
            .onTapGesture {
                viewRouter.currentPage = assignedpage
            }.foregroundColor(viewRouter.currentPage == assignedpage ? .accentColor : .gray)
    }
}
