
import Foundation


enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}


struct LoginRequestBody: Codable {
    let username: String
    let password: String
}
class UserAPI {
    private(set) var token : String = ""
    
    func login(username: String, password: String, completion: @escaping (Result<String,AuthenticationError>) -> Void){
        guard let url = URL(string: "http://localhost:5000/api/Account/login") else {
            completion(.failure(.custom(errorMessage:"URL is not correct")))
            return
        }
        let body = LoginRequestBody(username: username, password: password)
        
        var request = URLRequest(url:url)
        request.httpMethod="POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with:request) { data,response,error in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                        (200...299).contains(httpResponse.statusCode) else {
                        print(response)
                        return
            }
            
            
            guard let string = String(data: data, encoding: .utf8) else {
                completion(.failure(.invalidCredentials))
                return
            }
            self.token=string
            print(self.token)
            completion(.success(self.token))
            
           
            
        }.resume()
        
        
        
    }
}
