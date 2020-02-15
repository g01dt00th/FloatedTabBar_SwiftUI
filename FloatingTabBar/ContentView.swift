//
//  ContentView.swift
//  FloatingTabBar
//
//  Created by Роенко Денис on 11.02.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selected = 0
    @State var expand = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack {
                if self.selected == 0 {
                    NavigationView {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 15){
                                ForEach(1...7, id:\.self) { i in
                                    Image("\(i)").resizable().frame(height: 250).cornerRadius(15).shadow(radius: 10)

                                }
                            }.padding()
                                
                        }.navigationBarTitle("Home", displayMode: .inline)
                        .onTapGesture {}
                        .onLongPressGesture(minimumDuration: 1000000, maximumDistance: 1000, pressing: {pressing in
                                if pressing && self.expand { self.expand.toggle() }
                        }, perform: {})

                    }.onAppear(perform: {if self.expand { self.expand.toggle() } })

                } else if self.selected == 1 {
                    GeometryReader {_ in
                        Text("Wishlist") }
                } else {
                    GeometryReader {_ in
                        Text("Cart") }
                }
            }.background(Color("Color").edgesIgnoringSafeArea(.all))
                
            FloatingTabbar(selected: self.$selected, expand: self.$expand)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
