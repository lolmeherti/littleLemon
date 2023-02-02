//
//  Onboarding.swift
//  Restaurant
//
//  Created by Alex H. on 31.01.23.
//

let keyFirstName = "FirstName"
let keyLastName = "LastName"
let keyEmail = "Email"

let keyIsLoggedIn = "isLoggedIn"

import SwiftUI

struct Onboarding: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State var isLoggedIn = false
    
    @State var firstName = "asd"
    @State var lastName = "asd"
    @State var email = "asd@asd.com"
    
    var body: some View {
        NavigationView
        {
            
                VStack
                {
                    
                    NavigationLink("", destination: Home(), isActive: $isLoggedIn)
                        .hidden()
                    
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
                                    UserDefaults.standard.set(firstName, forKey: keyFirstName)
                                    UserDefaults.standard.set(lastName, forKey: keyLastName)
                                    UserDefaults.standard.set(email, forKey: keyEmail)
                                    UserDefaults.standard.set(true, forKey: keyIsLoggedIn)
                                    isLoggedIn = true
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

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
