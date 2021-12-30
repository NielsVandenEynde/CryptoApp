//
//  CoinListView.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 26/12/2021.
//

import SwiftUI

struct CoinListView: View {
    @ObservedObject var vm = CoinListViewModel()
    @State var coins = [Coin]()
    var body: some View {
        NavigationView{
        List(vm.listOfCoins){ coin in
            NavigationLink(destination: CoinDetailView() ){
            CoinListItem(symbol:coin.symbol,
                         name:coin.name,
                         price:coin.current_price,
                         pct:coin.price_change_percentage_24h)
            }
        }
        .onAppear(){
            vm.loadCoins()
        }
        }
        
    }
}


struct CoinListItem:  View {
    let symbol: String?
    let name: String?
    let price : Double?
    let pct: Double?
    var body: some View{
        VStack{
            HStack {
                Text(name ?? "nil").bold()
                Spacer()

            }
            HStack {
                Text(symbol ?? "nil")
                Spacer()
                Text("$\(price ?? 0.0,specifier: "%.2f")").bold()
                    
                Text("\(pct ?? 0.0,specifier: "%.2f")%")
                    .foregroundColor(pct! > 0.0 ? .green : pct! < 0.0 ? .red : .gray)
                
                
                
            }
            
            
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
