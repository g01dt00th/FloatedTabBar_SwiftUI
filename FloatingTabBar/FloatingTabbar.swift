//
//  FloatingTabbar.swift
//  FloatingTabBar
//
//  Created by Роенко Денис on 11.02.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct FloatingTabbar: View {
    @Binding var selected: Int
    @Binding var expand: Bool
    
    var body: some View {
        
        HStack {
            Spacer(minLength: 0)

            HStack {
                if self.expand {
                    Button(action: {
                        //action here
                        self.selected = 0
                    }) {
                        Image(systemName: "house").foregroundColor(self.selected == 0 ? .black : .gray ).padding(.horizontal)
                    }
                    Spacer(minLength: 15)
                    Button(action: {
                        //action here
                        self.selected = 1
                    }) {
                        Image(systemName: "hand.thumbsup").foregroundColor(self.selected == 1 ? .black : .gray ).padding(.horizontal)
                    }
                    Spacer(minLength: 15)
                    Button(action: {
                        //action here
                        self.selected = 2
                    }) {
                        Image(systemName: "cart").foregroundColor(self.selected == 2 ? .black : .gray ).padding(.horizontal)
                    }
                    Spacer(minLength: 15)
                    Button(action: {
                        //action here
                        self.expand.toggle()
                    }) {
                        Image(systemName: "arrow.right").foregroundColor(self.selected == 3 ? .black : .gray ).padding(.horizontal)
                    }

                } else {
                   
                    Button(action: {
                        // action here
                        self.expand.toggle()
                    }) {
                        Image(systemName: "arrow.left").foregroundColor(.black).padding()
                    }
                }
            }.padding(.vertical, self.expand ? 20 : 8)
            .padding(.horizontal, self.expand ? 35 : 8)
            .background(Color("TabBackColor"))
            .clipShape(Capsule())
            .padding(22)
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
                
        }

    }
        
}
