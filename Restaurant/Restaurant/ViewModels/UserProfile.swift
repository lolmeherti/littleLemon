//
//  UserProfile.swift
//  Restaurant
//
//  Created by Alex H. on 01.02.23.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State var firstName = UserDefaults.standard.string(forKey: keyFirstName) ?? ""
    @State var lastName = UserDefaults.standard.string(forKey: keyLastName) ?? ""
    @State var email = UserDefaults.standard.string(forKey: keyEmail) ?? ""
    @State var city = UserDefaults.standard.string(forKey: keyCity) ?? ""
    @State var country = UserDefaults.standard.string(forKey: keyCountry) ?? ""
    @State var address = UserDefaults.standard.string(forKey: keyAddress) ?? ""
    
    var body: some View {
        
        NavigationView {
            VStack()
            {
                Text("Personal Information")
                    .font(.title)
                
                Image("Profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 200, height:200)
                
                Section{
                    List{
                        VStack(alignment: .leading) {
                            Group{
                                Text("First Name")
                                    .font(.caption)
                                
                                TextField("First Name", text: $firstName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                Text("Last Name")
                                    .font(.caption)
                                
                                TextField("Last Name", text: $lastName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                Text("E-Mail")
                                    .font(.caption)
                                
                                TextField("email", text: $email)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                Text("Address")
                                    .font(.caption)
                                
                                TextField("address", text: $address)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                Text("City")
                                    .font(.caption)
                                
                                TextField("city", text: $city)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            Text("Country")
                                .font(.caption)
                            
                            TextField("country", text: $country)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Spacer()
                            Button("Save") {
                                
                                if(!firstName.isEmpty &&
                                   !lastName.isEmpty &&
                                   email.isEmail() &&
                                   !address.isEmpty &&
                                   !city.isEmpty &&
                                   !country.isEmpty)
                                {
                                    UserDefaults.standard.set(firstName, forKey: keyFirstName)
                                    UserDefaults.standard.set(lastName, forKey: keyLastName)
                                    UserDefaults.standard.set(email, forKey: keyEmail)
                                    UserDefaults.standard.set(address, forKey: keyAddress)
                                    UserDefaults.standard.set(city, forKey: keyCity)
                                    UserDefaults.standard.set(country, forKey: keyCountry)
                                } else {
                                    //form data  was incorrect
                                    print("bad form data")
                                }
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(5)
                            
                            Button("Logout") {
                                UserDefaults.standard.set(false, forKey: keyIsLoggedIn)
                                
                                self.presentation.wrappedValue.dismiss()
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(5)
                            Spacer()
                        }
                    }.listStyle(PlainListStyle())
                    
                }
            }
            
        }
        
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
