//
//  TabBar.swift
//  FinalProjectMSIS
//
//  Created by Robert Underwood on 3/31/20.
//  Copyright © 2020 Robert Underwood. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        // This is the master page
        // of all the pages we call to initiate
        
        TabView{
            
          Home().tabItem({
                Image("IconHome")
                Text("Home")
            })
        .tag(1)
            
            ListofCompany_s().tabItem({
                Image("IconCards")
                Text("Lists")
                }).tag(2)
            
            Settings().tabItem({
                Image("IconSettings")
                Text("Attendance")
                }).tag(3)
        }
      
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
