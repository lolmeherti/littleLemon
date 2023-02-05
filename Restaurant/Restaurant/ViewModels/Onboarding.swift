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
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    @State var validRegistrationDetails = false
    
    var body: some View {
        NavigationView
        {
            
            ZStack{
                VStack
                {
                    LittleLemonModal()
                    NavigationLink("", destination: Home(), isActive: $isLoggedIn)
                        .hidden()
                    
                    NavigationLink("", destination: Address(), isActive: $validRegistrationDetails)
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
                        
                        Text("E-mail(valid@emails.only)*")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        TextField("E-mail", text: $email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .frame(width: 350, height: 50)
                        
                        HStack{
                            Spacer()
                            Button("Next")
                            {
                                if(!firstName.isEmpty &&
                                   !lastName.isEmpty &&
                                   email.isEmail())
                                {
                                    UserDefaults.standard.set(firstName, forKey: keyFirstName)
                                    UserDefaults.standard.set(lastName, forKey: keyLastName)
                                    UserDefaults.standard.set(email, forKey: keyEmail)
                                    
                                    self.validRegistrationDetails = true
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
                    }
                    .padding()
                }
                .onAppear
                {
                    clearRegistrationForm()
                }
            }
        }
        
    }
    func clearRegistrationForm()
    {
        self.firstName = ""
        self.lastName = ""
        self.email = ""
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
