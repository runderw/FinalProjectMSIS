//
//  HomeList.swift
//  FinalProjectMSIS
//
//  Created by Robert Underwood on 3/31/20.
//  Copyright © 2020 Robert Underwood. All rights reserved.
//


import SwiftUI

struct HomeList: View {
    
    @State var showContent = false
    //creating variable course for all of our data in courseData
    var courses = coursesData
    
    var body: some View {
        ScrollView {
            VStack {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("AITP")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .padding(.leading, 50)
                        Text("Meetings Mondays & Wednesdays")
                            .foregroundColor(.gray)
                            .padding(.leading, 50)
                        .lineLimit(nil)
                    }.padding(.leading, 70)
                }
                    
                    
                .padding(.trailing, 120)
                .padding(.bottom, 40)
                
                HStack{
                    Text("Welcome!")
                                  .font(.system(size: 20))
                              .fontWeight(.heavy)
                        .padding(.leading, -160)
                }//creates title text
                
                //creating scrollView
                ScrollView(.horizontal, showsIndicators: false) {
                    //horiztontal stack for each card so we can format easier
                    HStack(spacing: 30) {
                        //foreach loop to loop through coursedata which we call up top as variable for courses
                        ForEach(courses) { item in
                            //appeartly each course is called in  button so we can click on each of them to pull card up
                            
                            Button(action: { self.showContent.toggle() }) {
                                // Geomertry reader is  just some style BS
                                GeometryReader{ geometry in
                                    CourseView(
                                        //Here is where we call course view and we have to fill in properties of function it just is in vertical format instead of horizontal like im used to.
                                       title: item.title,
                                       image: item.image,
                                       color: item.color,
                                       shadowColor: item.shadowColor
                                        
                                        )
                                        
                                        .rotation3DEffect(Angle(degrees:
                                            Double(geometry.frame(in: .global).minX - 40) / -20
                                        ), axis: (x: 0, y: 10.0, z: 0))
                                        
                                        //calling .sheet in button
                                        // this goes to content view which is card that pops up from bottom.
                                        //how does it pop up from the bottom ?? it is in its own function
                                        // Inside foreach loop , each card will take us to contentview
                                     
                                }.frame(width:246, height: 150)
                            }
                        }
                    }
                        .padding(.leading, 40) //padding for cards
                    Spacer()
                }.frame(height: 450)
                BottomRow()
              
            }
            .padding(.top, 70.0)
        }
        
        
        
        
        
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView : View {
    //CourseView shows each card
    // need to indentify  dummy  variables as place holders
    var title = "Lets Build that APp"
    var image = "Illustration2"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View {
        
        
        return VStack(alignment: .leading) {
           //doesnt require to use title or image as property of item or something
            
            Text(title)
               
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(30)
                .lineLimit(nil)
                .padding(.trailing, 50)
              
            Spacer()
            Image(image)
                .resizable()
                
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
                .frame(width: 246, height: 190)
                  //.shadow(radius: 60)
                .padding(.bottom, 30)
            
              
        }
         .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9071607837, green: 0.9071607837, blue: 0.9071607837, alpha: 0.3376980634)), Color(#colorLiteral(red: 0.3763738645, green: 0.3763738645, blue: 0.3763738645, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}


struct Course : Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}


// These are the cards to USE for home screen


let coursesData = [
    Course(
        title: "Welcome to AITP",
        image: "AITP",
         color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)),
        shadowColor: Color("backgroundShadow3")
    ),
    Course(
        title: "Hosted by...",
        image: "MSIS_Vrt_2_CMYK",
        color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)),
         
        shadowColor: Color("backgroundShadow4")
    ),
    Course(
          title: "Explore other programs",
          image: "MS_BUS_ANLY_DTA_SCI_Vrt_2_CMYK",
          color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)),
          shadowColor: Color("backgroundShadow4")
      ),

]


