//
//  CoinAPI.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 26/12/2021.
//

import Foundation
import Alamofire
enum CoinError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

class CoinAPI {
    
    func getAllCoins(completion: @escaping (Result<Array<Coin>,CoinError>) -> Void){
        let token = UserDefaults.standard.value(forKey: "jsonwebtoken") as? String


                    AF.request("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'").validate().responseDecodable(of: [Coin].self) { response2 in
                    debugPrint(response2)
                    if let coinswithprices = response2.value{
                        completion(.success(coinswithprices))
                        
                }
            }
            }
            //completion(.success(arrayofarrays.flatMap { $0}))
            
            
            //completion(.success(list))
            
        }

            
        


extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
    


