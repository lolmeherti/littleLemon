//
//  Home.swift
//  Restaurant
//
//  Created by Alex H. on 31.01.23.
//

import SwiftUI

struct Home: View {
    var body: some View {
       
        TabView
        {
            Menu()
                .tabItem{
                    Label("Home", systemImage: "list.dash")
                    
                }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
