//
//  ThankYou.swift
//  Restaurant
//
//  Created by Alex H. on 05.02.23.
//

import SwiftUI

struct ThankYou: View {
    @State var firstName = UserDefaults.standard.string(forKey: keyFirstName) ?? "Customer"
    @State var isLoggedIn = UserDefaults.standard.bool(forKey: keyIsLoggedIn)
    @State var onboardingDone = false
    @Binding var validAddress:Bool
    
    var body: some View {
        ZStack{
            VStack
            {
                LittleLemonModal()
                
                Spacer()
                
                NavigationLink("", destination: Home(), isActive: $onboardingDone)
                    .hidden()
                
                VStack
                {
                    Text("""
                    Dear \(firstName), we wanted to take a moment to express our gratitude for choosing our restaurant. We truly appreciate your business and it means a lot to us that you chose us for your dining experience.
                    
                    At our restaurant, we value customer feedback and strive to make every dining experience a memorable one. Your feedback is important to us and we take it seriously.
                    
                    Thank you again for choosing us, and we hope to see you soon.
                    
                    Best regards,
                    Little Lemon Restaurant
                    """)
                    .foregroundColor(.gray)
                    .padding()
                    
                    Spacer()
                    HStack{
                        Spacer()
                        
                        Button("Home")
                        {
                            if(validAddress){
                                self.onboardingDone = true
                                
                                UserDefaults.standard.set(true, forKey: keyIsLoggedIn)
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                        
                        Spacer()
                    }
                }
                
            }
        }
    }
}

