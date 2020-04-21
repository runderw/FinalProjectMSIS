//
//  Settings.swift
//  FinalProjectMSIS
//
//  Created by Robert Underwood on 3/31/20.
//  Copyright © 2020 Robert Underwood. All rights reserved.
//



import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

struct Settings: View {

   
    @State var Name = ""
    @State var CWID = ""
    @State var Company = ""
    @State var Code = ""
    
    var body: some View {
        
        NavigationView {
            Form {
              
                
                Section(header: Text("Attendance").font(.callout).padding(.top).padding(.bottom))
                {
                       Text("Name").font(.subheadline)
                    TextField("Your name", text: $Name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("CWID").font(.subheadline)
                    TextField("CWID", text: $CWID)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Code").font(.subheadline)
                    TextField("Code", text: $Code)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
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
