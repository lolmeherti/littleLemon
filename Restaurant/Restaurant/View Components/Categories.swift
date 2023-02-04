//
//  Categories.swift
//  Restaurant
//
//  Created by Alex H. on 04.02.23.
//

import SwiftUI
import CoreData

struct Categories: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let categories:[String]
    
    @Binding var filter: String
    
    var body: some View {
        VStack(
            alignment: HorizontalAlignment.leading,
            spacing: 20.0
        ) {
            Text("ORDER FOR DELIVERY!")
                .fontWeight(.bold)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal){
                HStack{
                    
                    //MARK: eliminating duplicates
                    let uniqueCategories = Set(categories)
                    
                    //MARK: normalizing categories for iteration
                    let normalizedCategories = Array(uniqueCategories)
                    
                    ForEach(normalizedCategories, id:\.self) {
                        category in
                        
                        Button(category) {
                            filter = category
                            }
                        .foregroundColor(Color("green_main"))
                        .fontWeight(.bold)
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(10)
                        .tint(Color("category_gray"))
                    }
                    
                }
            }
            
            Divider()
        }
        .padding()
    }
}


//struct Categories_Previews: PreviewProvider {
//    static var previews: some View {
//        Categories(categories: ["Main","Fuck", "Bastards"], filter: "mains")
//    }
//}
