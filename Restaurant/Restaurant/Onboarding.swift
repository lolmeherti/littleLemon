//
//  Onboarding.swift
//  Restaurant
//
//  Created by Alex H. on 31.01.23.
//

let keyFirstName = "key for first name"
let keyLastName = "key for last name"
let keyEmail = "key for email"

import SwiftUI

struct Onboarding: View {
    
    @State var isLoggedIn = false
    
    @State var firstName = "asd"
    @State var lastName = "asd"
    @State var email = "asd@asd.com"
    
    var body: some View {
        NavigationStack
        {
            if(isLoggedIn)
            {
                
                NavigationLink(value: Navigation.home) {
                    Home()
                        .navigationTitle(Navigation.home.rawValue)
                }
                
            } else {
                VStack
                {
                    Form
                    {
                        Section
                        {
                            TextField("First Name", text: $firstName)
                            
                            TextField("Last Name", text: $lastName)
                            
                            TextField("E-mail", text: $email)
                            
                            Button("Register")
                            {
                                if(!firstName.isEmpty &&
                                   !lastName.isEmpty &&
                                   email.isEmail())
                                {
                                    isLoggedIn.toggle()
                                    UserDefaults.standard.set(firstName, forKey: keyFirstName)
                                    UserDefaults.standard.set(lastName, forKey: keyLastName)
                                    UserDefaults.standard.set(email, forKey: keyEmail)
                                } else {
                                    //form data  was incorrect
                                    print("bad form data")
                                }
                            }
                        }
                    }
                    .navigationTitle("Registration")
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
