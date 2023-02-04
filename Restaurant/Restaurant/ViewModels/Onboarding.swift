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
    
    @State var isLoggedIn = UserDefaults.standard.bool(forKey: keyIsLoggedIn)
    
    @State var firstName = "asd"
    @State var lastName = "asd"
    @State var email = "asd@asd.com"
    
    var body: some View {
        NavigationView
        {
            
            ZStack{
                VStack
                {
                    LittleLemonModal()
                    
                    NavigationLink("", destination: Home(), isActive: $isLoggedIn)
                        .hidden()
                    
                    VStack(alignment: .leading, spacing:20){
                        Text("First Name*")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        TextField("First Name", text: $firstName)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .frame(width: 350, height: 50)
                        
                        Text("Last Name*")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        TextField("Last Name", text: $lastName)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .frame(width: 350, height: 50)
                        
                        Text("E-mail*")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        TextField("E-mail", text: $email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .frame(width: 350, height: 50)
                    }
                    
                    
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
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .foregroundColor(.white)
                    .padding(.top, 25)
                    .fontWeight(.medium)
                }
                .ignoresSafeArea(.all)
                
            }
            
        }
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
