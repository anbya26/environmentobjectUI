//
//  ContentView.swift
//  environmentobjectUI
//
//  Created by Mufti Ramdhani on 14/06/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var userAuth : AuthUser
  
  var body: some View {
    if !userAuth.isLoggedin {
      return AnyView(Login())
    }else {
      return AnyView(Home())
    }
  }
}

struct Home : View {
  @EnvironmentObject var userAuth : AuthUser
  
  var body: some View {
    NavigationView {
      ZStack {
        Color.purple
        
        Text("Home").foregroundColor(.white)
          .navigationBarTitle("Home", displayMode: .inline)
          .navigationBarItems(trailing:
                                Button(action: {self.userAuth.isLoggedin = false}){
                                  Image(systemName: "arrowshape.turn.up.right.circle")
                                }
          )
      }
      
    }
  }
}

struct Login : View {
  
  @EnvironmentObject var userAuth : AuthUser
  
  @State var username : String = ""
  @State var password : String = ""
  
  let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
  
  
//  func cekLogin() {
//    if(username == "Admin" && password == "123"){
//      userAuth.isLoggedin = true
//    }else {
//      userAuth.isLoggedin = false
//      userAuth.isCorrect = false
//    }
//  }
  
  var body: some View {
    ZStack {
      Color.white
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        HStack{
          HStack{
            VStack{
              Text("Hi!")
                .bold()
                .font(.largeTitle)
                .foregroundColor(Color.white)
              Text("Welcome back!")
                .font(.title)
                .foregroundColor(Color.white)
            }
            
            Spacer()
            
            Image("bitmap")
              .resizable()
              .frame(width:120, height:80)
              .padding()
          }
          
          Spacer()
        }
        .frame(height:180)
        .padding()
        .background(Color.purple)
        .clipShape(CustomShape(corner: .bottomRight, radii: 50))
        .edgesIgnoringSafeArea(.top)
        
        //formfield
        
        VStack(alignment:.leading){
          Text("username/email address")
          TextField("Username.....", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
          
          
          Text("password")
          SecureField("password...", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
          
          
          //tampilkan kesalahan
          if(!userAuth.isCorrect){
            Text("Username dan password salah!")
              .foregroundColor(.red)
          }
          
          
          HStack {
            Button(action:{}){
              Text("Forgot Password?")
            }
            Spacer()
          }.padding([.top,.bottom], 10)
          
          
          // Sign In Button
          
          HStack{
            Spacer()
            Button(action:{self.cekLogin()}){
              Text("Sign In")
                .bold()
                .font(.callout)
                .foregroundColor(.white)
            }
            Spacer()
          }
          .padding()
          .background(Color.purple)
          .cornerRadius(15)
          
          //privcy
          
          HStack{
            Spacer()
            Button(action:{}){
              Text("Our privacy policy")
                .bold()
                .font(.callout)
                .foregroundColor(.purple)
            }
            Spacer()
          }
          .padding()
          
          HStack{
            Text("Don't have an account?")
              .bold()
              .font(.callout)
              .foregroundColor(.black)
            Spacer()
            Button(action:{}){
              Text("Sign Up")
                .bold()
                .font(.callout)
                .foregroundColor(.purple)
            }
          }.padding()
          
        }.padding(30)
        
        Spacer()
        
      }
    }
  }
}

//custom shapes
struct CustomShape : Shape {
  var corner : UIRectCorner
  var radii : CGFloat
  
  func path(in rect: CGRect) ->Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner,  cornerRadii : CGSize(width: radii, height: radii))
    
    return Path(path.cgPath)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
