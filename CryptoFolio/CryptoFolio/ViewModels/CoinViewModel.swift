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
    init(id: String){
        self.id = id
    }
    let id : String
    let coinAPI = CoinAPI()
    @Published var ChartPoints : Array<LineChartDataPoint> = []
    @Published var period : Period = .day
    
    func loadCoins(id: String){
        
        self.coinAPI.getChartData(id: id, period: .day){ result in
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
enum Period : Double {
    case hour = 0.041666
    case day = 1
    case week = 7
    case month = 30
    case year = 365
}


