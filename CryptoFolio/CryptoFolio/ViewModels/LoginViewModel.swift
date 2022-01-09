//
//  LoginViewModel.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 26/12/2021.
//

import Foundation

class LoginViewModel: ObservableObject {

    private let userAPI = UserAPI()
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage : String = ""
 
    func login(username: String, password: String) {
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
                DispatchQueue.main.async {
                    self.errorMessage = "Username or password is incorrect"
                }
                
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
