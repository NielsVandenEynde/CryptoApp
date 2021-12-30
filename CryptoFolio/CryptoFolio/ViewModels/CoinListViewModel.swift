//
//  CoinListViewModel.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 27/12/2021.
//

import Foundation

class CoinListViewModel: ObservableObject {
    
    let coinAPI = CoinAPI()
    @Published var listOfCoins : Array<Coin> = []
    
    func loadCoins(){
        
        self.coinAPI.getAllCoins(){ result in
        switch result {
        case .success(let arr):
            //print(arr)
            DispatchQueue.main.async{
                
                
                self.listOfCoins=arr
                
                
            }

        case .failure(let error):
            print(error.localizedDescription)
        }
    }
        

    }
}
