//
//  CoinAPI.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 26/12/2021.
//

import Foundation
import Alamofire
import SwiftUICharts
enum CoinError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

class CoinAPI {
    
    func getAllCoins(completion: @escaping (Result<Array<Coin>,CoinError>) -> Void){
        let token = UserDefaults.standard.value(forKey: "jsonwebtoken") as? String
        AF.request("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'")
            .validate()
            .responseDecodable(of: [Coin].self) { response2 in
                debugPrint(response2)
                if let coinswithprices = response2.value{
                    completion(.success(coinswithprices))
                }
            }
            }
    func getChartData(id: String, period: Period,completion: @escaping (Result<Array<LineChartDataPoint>,CoinError>) -> Void){
        let days : Double = period.rawValue
        var req = "https://api.coingecko.com/api/v3/coins/\(id)/market_chart?vs_currency=usd&days=\(days)"
        print(req)
        AF.request(req)
            //.validate()
            .responseDecodable(of: ChartData.self){ response3 in
                debugPrint(response3)
                if let res = response3.value{
                    var arr = [LineChartDataPoint]()
                    for point in res.prices{
                        let date = Date(milliseconds: Int64(point[0]))

                        let dayTimePeriodFormatter = DateFormatter()
                        dayTimePeriodFormatter.dateFormat = "hh:mm, dd MMM"

                        let dateString = dayTimePeriodFormatter.string(from:date)

                          //print( " _ts value is \(_ts)")
                          //print( " _ts value is \(dateString)")
                        arr.append(LineChartDataPoint(value: point[1], description: dateString))
                    }
                    completion(.success(arr))
                }
            }
    }
            
}
struct ChartData : Codable {
    var prices : Array<Array<Double>>
}

            
        


extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
extension Date {
    var millisecondsSince1970:Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}


