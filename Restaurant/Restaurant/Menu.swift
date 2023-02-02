//
//  Menu.swift
//  Restaurant
//
//  Created by Alex H. on 31.01.23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        NavigationView{
            VStack
            {
                Text("Little Lemon")
                Text("Chicago")
                Text("Welcome to the little lemon restaurant app. Order food with ease!")
                
                List
                {
                    
                }
            }

        }
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
