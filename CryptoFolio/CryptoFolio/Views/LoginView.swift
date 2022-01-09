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
    @State var username: String = ""
    @State var password: String = ""
    @ObservedObject private var loginVM = LoginViewModel()
    @EnvironmentObject var viewRouter: ViewRouter

    
    var body: some View {
       

        VStack {
            WelcomeText()
            Spacer()
            TextField("Username", text: $username)
                .padding()
                .background(lightblue)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .background(lightblue)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button(action: {
                loginVM.login(username:username,password:password)
            }) {
                LoginButtonContent(username:$username,password:$password)
            }.disabled(username.isEmpty || password.isEmpty)
            
            Button(action: {print("not available on mobile")}){
                Text("register")
            }
            Spacer()
        }
        .padding()
        .onChange(of: loginVM.isLoggedIn){newValue in
            if newValue {
                viewRouter.currentPage = Page.page2
            }
        }
    }
}
struct WelcomeText : View {
    
    var body: some View {
       
        Text("Cryptofolio")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
        Image("monerologo")
            .resizable()
            .scaledToFit()
    }
}
struct LoginButtonContent : View {
    @Binding var username: String
    @Binding var password: String
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background((username.isEmpty || password.isEmpty) ? Color(UIColor.lightGray) : btnColor)
            .cornerRadius(15.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
