//
//  Coin.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 27/12/2021.
//

import Foundation

struct Coin: Decodable, Identifiable{
    init(){
        id = ""
        symbol = ""
        name = ""
        current_price = 0.0
        price_change_percentage_24h = 0.0
        chartPoints = []
    }
    var chartPoints : [Double]?
    var id: String?
    var symbol: String?
    var name: String?
    var current_price: Double?
    var price_change_percentage_24h: Double?
    
}

extension Coin {
    func merge(with: Coin) -> Coin {
        var new = Coin()
        new.id = id
        new.symbol = symbol
        new.name = name
        new.current_price = with.current_price
        new.price_change_percentage_24h = with.price_change_percentage_24h
        return self
    }
}
