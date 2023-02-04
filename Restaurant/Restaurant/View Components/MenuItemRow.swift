//
//  MenuItemRow.swift
//  Restaurant
//
//  Created by Alex H. on 04.02.23.
//

import SwiftUI
import Dispatch
import Swift

struct MenuItemRow: View {
    
    @State var imageData: Data = Data()
    
    let dish: Dish
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(dish.title ?? "")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom,1)
                
                Text(dish.dishDescription ?? "")
                    .lineLimit(2)
                    .foregroundColor(.gray)
                    .opacity(0.8)
                    .padding(.bottom,1)
                
                Text("$\(dish.price ?? "10")")
                    .foregroundColor(.green)
            }
            .onAppear{
                
            }
            Spacer()
            Image(uiImage: imageData.isEmpty ? UIImage() : UIImage(data: imageData)!)
                .resizable()
                .cornerRadius(10)
                .frame(width: 120, height: 100)
                .onAppear {
                    self.loadImage()
                }
              
        }
        .padding(20)
    }
    
    func loadImage() {
        guard let url = URL(string: dish.image ?? "") else { return }
         
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 DispatchQueue.main.async {
                     self.imageData = data
                 }
             }
         }.resume()
     }
}

//struct MenuItemRow_Previews: PreviewProvider {
//
//    let dish = Dish()
//
//
//    static var previews: some View {
//        MenuItemRow(dish:dish)
//    }
//}
