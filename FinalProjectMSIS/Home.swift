//
//  Home.swift
//  FinalProjectMSIS
//
//  Created by Robert Underwood on 3/31/20.
//  Copyright © 2020 Robert Underwood. All rights reserved.
//



import SwiftUI



struct Home: View {
    //show state needs to communicate with parent component and menuiew we willl cretae binding in subview
    
    // create different state variables for different views of menus
    // if we had all same state variable for ssame view state then every button would do the same and show the same menu or wtv
    @State var sow = false
    @State var show = false
    
    @State var showProfile = false
    var body: some View {
        ZStack{
            
            //just shows card view?
            HomeList()
                .blur(radius: show ? 20: 0)
                //  .scaleEffect(showProfile ? 0.95: 0)
                .animation(.default)
            
       
            
               
            VStack {//Buttons and menu
                HStack {
                    MenuButton(show: $show)
                        // if we toggle/showprofile put it at 0 or very top
                        //if not then we lower it down
                        .offset(x:-30, y: showProfile ? 0 : 80)
                               //  .offset(x:-30, y: $show ? 0 : 80)
                        .animation(.spring())
                    
                    Spacer()
                    
                 
                    
                    BellButton(sow: $sow)
                        .offset(x:-30, y: showProfile ? 0 : 80)
                        .animation(.spring())
                }
                Spacer()
            }
            
            //Created my own variable sow as bool for whether bell button is clicker or not
            UpdateD(sow: $sow)
                
                .background(Color.white)
                              .cornerRadius(20)
                              .animation(.spring())
                  .offset(y: sow ? 46 : UIScreen.main.bounds.height)
            //now we pass in binding variable
            //$ means listen to the chagnes
         
            MenuView(show: $show)
            
        }
        
    }
}







struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow : View{
    var image = "credit"
    var text = "Account"
    var body: some View {
        //menu row in our slide out menu
        //easier to format?
        
        return  HStack{
            
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 35, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }.padding(10)
        
    }
    
}

//constructo for "array"
struct Menu : Identifiable {
    
    var id = UUID()
    var title: String
    var icon: String
    
    
}
// is array of data
let menuData = [
    Menu(title: "Sign in and show up regularly to be a confirmed member", icon: "person.crop.circle"),
    Menu(title: "Job Oppurtunities from companies in various industries", icon: "creditcard"),
    Menu(title: "Connect with recruiters and peers to build your network", icon: "person.and.person"),
    Menu(title: "You are free to leave once attendance is taken, no leaving mid meeting!", icon: "arrow.uturn.down")
]

struct MenuView: View {
    
    //this is useless once we start
    //var menuItems = ["My Account", "Billing", "Members", "Sign out"]
    // have to use binding in this function as we call a state variable in early function TOP*^
    @Binding var show : Bool
    
    //calling all data in menudataButton(){
    
    var menu = menuData
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            //looping through menudata
            ForEach(menu){ item in
                //may need to inialize all arryas like this
                MenuRow(image: item.icon, text: item.title)
            
            }
            
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0 , maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 10)
        .rotation3DEffect(Angle(degrees: show ? 0: 60), axis: (x: 0, y: 10, z: 0))
        .animation(.linear)
            //- means its outside on the left
            // if we toggle it shows if not then it hides it
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()// this is toggled when we press button
        }
    }
 
}

struct MenuButton: View {
    @Binding var show: Bool
    var body: some View {
        Button(action:{ self.show.toggle() }){
            
            Image(systemName: "list.dash")
                .foregroundColor(.black)
            
        }
        .padding(.leading, 39)
        .frame(width: 90, height: 60)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 12)
        
    }
}

struct PersonButton: View {
    @Binding var show: Bool
    var body: some View {
        Button(action:{ self.show.toggle() }){
            
            Image(systemName: "person.crop.circle")
                .foregroundColor(.black)
            
        }
            
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 12)
    }
}

struct BellButton: View {
    @Binding var sow: Bool
    var body: some View {
        // show.toggle to determeine if we click it or not
        // show is false so if we click it is true
        //
        Button(action:{ self.sow.toggle() }){
            
            Image(systemName: "bell")
                .foregroundColor(.black)
            
        }
            //basic formating for size and color
            .frame(width: 44, height: 44)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 12)
    }
}

struct UpdateD: View {
    //show @State var show = false
    @Binding var sow: Bool
    var title = "Notifications?"
    var text = "If you would like to recieve notifications please enbable them in the attendance page!"
    var image = "Illustration2"
    var body: some View {
        
        VStack(spacing: 20) {
            Text(title).font(.largeTitle)
                .fontWeight(.heavy)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            
            Text(text).font(.subheadline)
                .lineLimit(nil)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }.padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0 , maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
            .shadow(radius: 10)
              
            .rotation3DEffect(Angle(degrees: sow ? 0: 60), axis: (x: 0, y: 10, z: 0))
            .animation(.linear)
        .offset(x: sow ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.sow.toggle()
        }
        
        
    }
}
