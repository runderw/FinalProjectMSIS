//
//  BottomRow.swift
//  FinalProjectMSIS
//
//  Created by Robert Underwood on 3/31/20.
//  Copyright © 2020 Robert Underwood. All rights reserved.
//

import SwiftUI

struct BottomRow: View {
   var certificates = certificateData
       var body: some View {
            
           
           VStack(alignment: .leading) {
               Text("Sponsored   Companys")
                   .font(.system(size: 20))
               .fontWeight(.heavy)
                         .padding(.leading, 40)
               
           
           ScrollView(.horizontal, showsIndicators: false) {
               
               HStack(spacing: 20) {
                   ForEach(certificates) {  item in
                       CertificateView(item: item)
                   }
               }.padding(20)
                   .padding(.leading, 20)
           }
               
           }
       }
}

struct BottomRow_Previews: PreviewProvider {
    static var previews: some View {
        BottomRow()
    }
}
struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var width: Int
    var height: Int
}
let certificateData = [
    Certificate(title: "ConocoPhillips", image: "Conoco", width: 230, height: 150),
    Certificate(title: "Paycom", image: "Paycom", width: 230, height: 150),
    Certificate(title: "ExxonMobil", image: "Exxon", width: 230, height: 150),
    Certificate(title: "OneOk", image: "OneOK", width: 230, height: 150),
        Certificate(title: "OneGas", image: "OneGas", width: 230, height: 150),
    Certificate(title: "Hilti", image: "Hilti", width: 230, height: 150)
]



struct CertificateView: View {
    var item  = Certificate(title: "UI Design", image: "Background", width: 340, height: 220)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.medium)
                       .foregroundColor(.white)
                        .padding(.top)
                 
                }
                Spacer()
               
            }
            .padding(.horizontal)
            Spacer()
            Image(item.image)
            .resizable()
            .cornerRadius(8)
                .frame(width: 110, height: 100)
                .offset(x: 45, y: -9)
        }
        .frame(width: CGFloat(item.width), height:  CGFloat(item.height))
      .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
