//
//  LoginViewModel.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 26/12/2021.
//

import Foundation

class LoginViewModel: ObservableObject {
//    init(){
//        self.userAPI = UserAPI()
//        self.isLoggedIn = false
//    }
    var username: String = ""
    var password: String = ""
    @Published var userAPI = UserAPI()
    @Published var isLoggedIn: Bool = false

    
    var loginDisabled: Bool {
        username.isEmpty || password.isEmpty
        
    }

    
    func login() {
        let defaults = UserDefaults.standard
        
        userAPI.login(username:username,password:password) { result in
            switch result {
            case .success(let token):
                print(token)
                defaults.setValue(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isLoggedIn = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func logout() {
           
           let defaults = UserDefaults.standard
           defaults.removeObject(forKey: "jsonwebtoken")
           DispatchQueue.main.async {
               self.isLoggedIn = false
           }
           
       }
    
}
