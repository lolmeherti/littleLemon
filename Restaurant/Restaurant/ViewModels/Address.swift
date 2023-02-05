//
//  Address.swift
//  Restaurant
//
//  Created by Alex H. on 05.02.23.
//

let keyAddress = "Address"
let keyCity = "City"
let keyCountry = "Country"


import SwiftUI

struct Address: View {
    @State var address:String = ""
    @State var city:String = ""
    @State var country:String = ""
    
    @State var validAddress = false
    var body: some View {
        
        ZStack{
            VStack
            {
                LittleLemonModal()
                
                NavigationLink("", destination: ThankYou(validAddress: $validAddress), isActive: $validAddress)
                    .hidden()
                
                VStack(alignment: .leading, spacing:20){
                    Text("Address*")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("Address", text: $address)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .frame(width: 350, height: 50)
                    
                    Text("City*")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("City", text: $city)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .frame(width: 350, height: 50)
                    
                    Text("Country*")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("Country", text: $country)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .frame(width: 350, height: 50)
                    
                    HStack{
                        Spacer()
                        Button("Next")
                        {
                            if(!address.isEmpty &&
                               !city.isEmpty &&
                               !country.isEmpty)
                            {
                                UserDefaults.standard.set(address, forKey: keyAddress)
                                UserDefaults.standard.set(city, forKey: keyCity)
                                UserDefaults.standard.set(country, forKey: keyCountry)
                                
                                self.validAddress = true
                                
                                        UserDefaults.standard.set(true, forKey: keyIsLoggedIn)
                                        //isLoggedIn = true
                            } else {
                                //form data  was incorrect
                                print("bad form data")
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                        
                        Spacer()
                    }
                }.padding()
            }
            .onAppear
            {
                clearAddressForm()
            }
        }
    }
    func clearAddressForm()
    {
        self.address = ""
        self.country = ""
        self.city = ""
    }
}

struct Address_Previews: PreviewProvider {
    static var previews: some View {
        Address()
    }
}
