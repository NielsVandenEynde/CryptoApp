//
//  CoinViewModel.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 30/12/2021.
//

import Foundation
import SwiftUI
import SwiftUICharts

class CoinViewModel: ObservableObject {
    init(coin: Coin){
        self.coin = coin
    }
    let coin : Coin
    let coinAPI = CoinAPI()
    @Published var ChartPoints : Array<LineChartDataPoint> = []
    @Published var period : Period = .day
    
    func loadChart(period: Period){
        let id : String = coin.id
        self.period = period
        self.coinAPI.getChartData(id: id, period: period){ result in
        switch result {
        case .success(let data):

            DispatchQueue.main.async{
                self.ChartPoints = data
            }

        case .failure(let error):
            print(error.localizedDescription)
        }
    }
        

    }

    
}
enum Period : Double, CaseIterable {

    
    case hour = 0.041666
    case day = 1
    case week = 7
    case month = 30
    case year = 365
    
    var displayName: String {
        switch self {
        case .hour:
            return "1H"
        case .day:
            return "1D"
        case .week:
            return "1W"
        case .month:
            return "1M"
        case .year:
            return "1Y"
}
    }
}


