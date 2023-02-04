//
//  Menu.swift
//  Restaurant
//
//  Created by Alex H. on 31.01.23.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        
        NavigationView{
            VStack
            {
                Text("Little Lemon")
                Text("Chicago")
                Text("Welcome to the little lemon restaurant app. Order food with ease!")
                
                FetchedObjects() { (dishes: [Dish]) in
                    List
                    {
                        
                        ForEach(dishes){dish in
                            HStack
                            {
                                Text(dish.title ?? "N/A")
                                Text(dish.price ?? "N/A")
                                Text(dish.dishDescription ?? "N/A")
                            }
                        }
                    }
                }
                
                .onAppear{
                    getMenuData()
                }
                
            }
            
        }
    }
    
    func exists(in context: NSManagedObjectContext, attributeValue: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dish")
        fetchRequest.predicate = NSPredicate(format: "title = %@", attributeValue)
        
        do {
            let results = try context.fetch(fetchRequest)
            return results.count > 0
        } catch {
            print("Error fetching objects")
            return false
        }
    }
    
    func getMenuData()
    {
        
        let url = URL(string:"https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        
        let request = URLRequest(url: url!)
        
        let urlSession = URLSession.shared.dataTask(with: request) { data, response, error  in
            
            if let data = data {
                print("we have data to decode")
                let decoder = JSONDecoder()
                let results = try? decoder.decode(MenuList.self, from: data)
                
                if let results = results {
                    print("we decoded some data")
                    for item in results.menu {
                        
                        //MARK: making sure to not save duplicates
                        let exists = exists(in: viewContext, attributeValue: item.title)
                    
                        if(exists)
                        {
                            print("skipped existing item")
                            continue
                        }
                        
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.image = item.image
                        dish.price = item.price
                        dish.category = item.category
                        dish.dishDescription = item.description
                        try? viewContext.save()
                        
                        print("we tried to save a menu item")
                    }
                }
            }
        }
        urlSession.resume()
    }
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
