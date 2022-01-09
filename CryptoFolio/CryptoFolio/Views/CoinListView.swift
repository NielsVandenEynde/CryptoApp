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
            NavigationLink(destination: CoinDetailView(coin:coin) ){
                CoinListItem(image:coin.image,
                        symbol:coin.symbol,
                         name:coin.name,
                         price:coin.current_price,
                         pct:coin.price_change_percentage_24h)
            }
        }
        .listStyle(PlainListStyle())
        .onAppear(){
            
            vm.loadCoins()
        }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}


struct CoinListItem:  View {
    let imageWidthMultiplier = 0.1
    let image: String
    let symbol: String
    let name: String
    let price : Double
    let pct: Double
    var body: some View{
        GeometryReader{ geo in
        HStack{
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: image),content: { phase in
                    switch phase {
                            case .empty:
                                Text("gey")
                            case .success(let image):
                                image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: geo.size.width*imageWidthMultiplier, maxHeight: geo.size.width*imageWidthMultiplier)
                            case .failure:
                                Text("gey")
                            @unknown default:
                                Text("gey")
                    }
                })
            }
                 
        VStack{
            HStack {

                Text(name).bold()
                Spacer()

            }
            HStack {
                Text(symbol)
                Spacer()
                Text("$\(price ,specifier: "%.2f")").bold()
                    
                Text("\(pct ,specifier: "%.2f")%")
                    .foregroundColor(pct > 0.0 ? .green : pct < 0.0 ? .red : .gray)
            }
        }
        }
    }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
