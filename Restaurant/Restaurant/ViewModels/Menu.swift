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
    
    @State private var searchText = ""
    @State private var showSearchField = false
    @State private var filter = ""
    
    var body: some View {
        
        NavigationView{
            VStack
            {
                //MARK: banner modal
                LittleLemonModal()
                if showSearchField {
                    TextField("Search", text: $searchText)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .onDisappear {
                            self.showSearchField = false
                            self.filter = ""
                            self.searchText = ""
                        }
                } else {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .onTapGesture {
                            self.showSearchField.toggle()
                        }
                }
                
                FetchedObjects(predicate: buildPredicate(),
                               sortDescriptors: buildSortDescriptors())
                { (dishes: [Dish]) in
                    
                    //MARK: dynamically getting categories from Core Data
                    Categories(categories: getCategories(), filter: $filter)
                    
                    List
                    {
                        ForEach(dishes){dish in
                                MenuItemRow(dish: dish)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                .onAppear{
                    getMenuData()
                }
                
            }
            .background(
                    Color.clear.onTapGesture {
                        self.showSearchField = false
                    }
                )
            .animation(.default)
            
        }
    }
    
    func getCategories() -> [String] {
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        
        do {
            let dishes = try viewContext.fetch(fetchRequest)
            let categories = dishes.map { $0.value(forKey: "category") as! String }
            return categories
        } catch let error as NSError {
            print("Fetch error: \(error), \(error.userInfo)")
        }
        
        return []
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                 ascending: true,
                                 selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        
        //MARK: i want search to ignore category filter, this is on purpose
        if(!searchText.isEmpty){
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        
        //MARK: filter only works if search field is empty, this is on purpose
        if (!filter.isEmpty && searchText.isEmpty){
            return NSPredicate(format: "category = %@", filter)
        }
        
        return NSPredicate(value: true)
    }
    
    //MARK: this function is important in order to not save duplicate data from the API call
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
                    print("we decoded data")
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
                        
                        print("we saved a menu item")
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
