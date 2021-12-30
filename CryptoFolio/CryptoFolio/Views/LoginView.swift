//
//  LoginView.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 26/12/2021.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let lightblue = Color(red:171.0/255.0,green:186.0/255.0,blue:209.0/255.0)
let btnColor = Color(red: 0.0, green: 0.059, blue: 0.18)


struct LoginView : View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var viewRouter: ViewRouter

    
    var body: some View {
       

        VStack {
            WelcomeText()
            //UserImage()
            Spacer()
            
            TextField("Username", text: $loginVM.username)
                .padding()
                .background(lightblue)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $loginVM.password)
                .padding()
                .background(lightblue)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button(action: {
                print("Button tapped")
                loginVM.login()
                //if loginVM.isLoggedIn{
                //viewRouter.currentPage = Page.page3
                //}
                
            }) {
               LoginButtonContent()
            }
            Button(action: {viewRouter.currentPage = Page.page2}){
                Text("hello")
            }
            Spacer()
            
        }
        .padding()
        .onChange(of: loginVM.isLoggedIn){newValue in
            if newValue {
                viewRouter.currentPage = Page.page3
            }
        }
        
        
        
    }
        
}
struct WelcomeText : View {
    
    var body: some View {
       
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
        Image("monerologo")
            .resizable()
            .scaledToFit()
            
    
    }
}
struct LoginButtonContent : View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(btnColor)
            .cornerRadius(15.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
