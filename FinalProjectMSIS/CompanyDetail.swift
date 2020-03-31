//
//  CompanyDetail.swift
//  FinalProjectMSIS
//
//  Created by Robert Underwood on 3/31/20.
//  Copyright © 2020 Robert Underwood. All rights reserved.
//


import SwiftUI

struct CompanyDetail: View {
    var title = "default"
    var image  = "Conoco"
    var label = "label ksdjfh dksjfhg ksdfgh kjsdfg dsfgkjh sdfkjgh dskjfgh skdjfhg kjdshfgjksdgsdhfgkjhsdfg jk sdfkjghsdkjfgjsdfh kjsdfhg kjsdfhgjksdfghkjsdfgsdfg kj sdfgkjhdfg"

    var body: some View {
       VStack(spacing: 20){
                   
                   // WE call title
                   Text(title)
                       .font(.largeTitle)
                       .fontWeight(.medium)
                    
                   
                   Image(image)
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(height: 200)
                   Text(label)
                       .font(.subheadline)
                    .padding()
                       
                 }.offset(y: -150)
        
        
    }
}

struct CompanyDetail_Previews: PreviewProvider {
    static var previews: some View {
        CompanyDetail()
    }
}
