
import Foundation


enum AuthenticationError {
    case invalidCredentials
    case custom(errorMessage: String)
}
class UserAPI {

    func login(username: String, password: String, completion: @escaping (result<String,AuthenticationError>) -> Void){
        guard let url = URL(string: "")
    }
}
