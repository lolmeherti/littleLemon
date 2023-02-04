//
//  LittleLemonModal.swift
//  Restaurant
//
//  Created by Alex H. on 04.02.23.
//

import SwiftUI

struct LittleLemonModal: View {
    var body: some View {
        
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 400, height: 320)
                .foregroundColor(Color("green_main"))
            
            VStack(alignment: .leading){
                Text("Little Lemon")
                    .foregroundColor(Color("yellow_title"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Chicago")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 15)
                
                HStack {
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .foregroundColor(.white)
                        .font(.headline)
                    Image("Hero_image")
                        .resizable()
                        .frame(width: 180, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                           .cornerRadius(15)
                           .shadow(radius: 10)
                           .padding(.leading, 15)
                }
            }
            .padding(15)
            
            Spacer()
        }
        
    }
}

struct LittleLemonModal_Previews: PreviewProvider {
    static var previews: some View {
        LittleLemonModal()
            .previewLayout(.sizeThatFits
            )
    }
}
