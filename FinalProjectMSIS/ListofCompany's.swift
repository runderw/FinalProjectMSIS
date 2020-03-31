//
//  ListofCompany's.swift
//  FinalProjectMSIS
//
//  Created by Robert Underwood on 3/31/20.
//  Copyright © 2020 Robert Underwood. All rights reserved.
//


import SwiftUI

struct ListofCompany_s: View {
    var body: some View {
        NavigationView{
                         List{
                             // Foreach listdata that we have
                             ForEach(ListData) { item in
                                   
                                 //We call DetailListView Function in our navigationlink, we pass in parameters that we have dummy variables set for in our other function
                                 //we use dummy variables as placeholder parameters for our function to call in
                                 
                                 
                                 NavigationLink(destination: CompanyDetail(title: item.title, image: item.image)){
                                     
                                     // KEeping our HStack in our NAvigationLink
                                     HStack {
                                         Image(item.image)
                                             .resizable()
                                             .renderingMode(.original)
                                             //.aspectRatio(contentMode: .fit)
                                             .frame(width: 80, height: 80)
                                             .background(Color("primary"))
                                             .cornerRadius(20)
                                             .padding(.trailing, 4)

                                                                 
                                         // VStack

                                         
                                    VStack(alignment: .leading, spacing: 8) {
                                     
                                     Text(item.title).font(.system(size: 20, weight: .bold))
                                     
                                     Text(item.label)
                                              .lineLimit(2)
                                              .font(.subheadline)
                                              .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                          Text("Secondary")
                                              .font(.caption)
                                              .fontWeight(.bold)
                                              .foregroundColor(.secondary)
                                     
                                     } .padding(3)
                                         
                                     }.padding(.vertical, 8)
                                 }   // end of navigation link
                             }.padding(8)
                             
                             .navigationBarTitle(Text("Meetings"))
                         }
                     }

    }
}

struct ListofCompany_s_Previews: PreviewProvider {
    static var previews: some View {
        ListofCompany_s()
    }
}



struct ListItem : Identifiable{
    var id = UUID()
    var title : String
    var icon : String
    var image: String
    var label: String
    
}

let ListData = [
    
    ListItem(title: "OneGas", icon: "house", image: "OneGas", label: "2-8-2020"),
    ListItem(title: "OneOK", icon: "gear", image: "OneOK", label: "2-22-2020"),
    ListItem(title: "Paycom", icon: "person", image: "Paycom", label: "2-24-2020"),
     ListItem(title: "Hilti", icon: "person", image: "Hilti", label: "3-13-2020"),
     ListItem(title: "ExxonMobil", icon: "person", image: "Exxon", label: "3-15-2020"),
    ListItem(title: "ConocoPhillips", icon: "person", image: "Conoco", label: "4-15-2020")
]
