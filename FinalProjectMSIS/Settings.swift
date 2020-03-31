//
//  Settings.swift
//  FinalProjectMSIS
//
//  Created by Robert Underwood on 3/31/20.
//  Copyright © 2020 Robert Underwood. All rights reserved.
//



import SwiftUI

struct Settings: View {

   
    @State var email = ""
    @State var Password = ""
    @State var submit = false
    
    var body: some View {
        
        NavigationView {
            Form {
              
                
                Section(header: Text("Credintials").font(.callout).padding(.top).padding(.bottom))
                {
                       Text("Email").font(.subheadline)
                    TextField("Your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Password").font(.subheadline)
                    TextField("Password", text: $Password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: { self.submit.toggle() }) {
                    
                    Text("Submit")
                }
                    
                    
                    
                    
                .navigationBarTitle(Text("Attendance"))
            }
            
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
