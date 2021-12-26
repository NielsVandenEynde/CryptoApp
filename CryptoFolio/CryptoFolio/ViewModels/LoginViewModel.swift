//
//  LoginViewModel.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 26/12/2021.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    var username: String = ""
    var password: String = ""
    let userAPI = UserAPI()
    @Published var isLoggedIn: Bool = false
    
    var loginDisabled: Bool {
        username.isEmpty || password.isEmpty
        
    }

    
    func login() {

        userAPI.login(username:username,password:password) { result in
            switch result {
            case .success(let token):
                print(token)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
