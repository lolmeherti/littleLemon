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
    
    var body: some View {
        NavigationView {
            VStack
            {
                Text("Personal Information")
                
                Image("Placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                
                Section{
                    Form{
                        Text(firstName)
                        Text(lastName)
                        Text(email)
                    
                        Button("Logout")
                        {
                            UserDefaults.standard.set(false, forKey: keyIsLoggedIn)
                            self.presentation.wrappedValue.dismiss()
                        }
                    }
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
