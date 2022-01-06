//
//  CoinDetailView.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 30/12/2021.
//

import SwiftUI
import SwiftUICharts

struct CoinDetailView: View {
    init(coinID: String){
        vm = CoinViewModel(id: coinID)
    }
    @ObservedObject var vm : CoinViewModel

    var body: some View {
        VStack{
            LineChartView(chart: vm.ChartPoints)
        }.onAppear(){
            vm.loadCoins(id: vm.id)
        }
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("lol")
        //CoinDetailView(coin: Coin())
    }
}

struct LineChartView: View {
    var chart : Array<LineChartDataPoint>?
    var body: some View {
        if let points = chart{
            let data = LineChartData(dataSets:LineDataSet(dataPoints:points))
            LineChart(chartData: data ).id(data.id)
        }
    }
}
