//
//  CoinDetailView.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 30/12/2021.
//

import SwiftUI
import SwiftUICharts

struct CoinDetailView: View {
    @State var selectedPeriod: Period = .day
    init(coin: Coin){
        vm = CoinViewModel(coin: coin)
    }
    @ObservedObject var vm : CoinViewModel

    var body: some View {
        VStack{
            LineChartView(vm: vm,selectedPeriod: $selectedPeriod,chart: vm.ChartPoints)
        }.onAppear(){
            vm.loadChart(period: selectedPeriod)
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
    @ObservedObject var vm : CoinViewModel
    @Binding var selectedPeriod : Period
    var chart : Array<LineChartDataPoint>?
    var body: some View {
        if let points = chart{
            let metadata   = ChartMetadata(title: vm.coin.name, subtitle: "\(vm.coin.current_price)$")

            let gridStyle  = GridStyle(numberOfLines: 7,
                                       lineColour   : Color(.lightGray).opacity(0),
                                       lineWidth    : 1,
                                       dash         : [8],
                                       dashPhase    : 0)

            let chartStyle = LineChartStyle(infoBoxPlacement    : .infoBox(isStatic: false),
                                            infoBoxBorderColour : Color.primary,
                                            infoBoxBorderStyle  : StrokeStyle(lineWidth: 1),
                                            
                                            markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                            xAxisGridStyle      : gridStyle,
                                            xAxisLabelsFrom     : .chartData(),
                                            yAxisGridStyle      : gridStyle,
                                            yAxisLabelPosition  : .leading,
                                            
                                            yAxisLabelColour    : Color.primary,
                                            yAxisNumberOfLabels : 3,

                                            globalAnimation     : .easeOut(duration: 1))
            let data = LineChartData(dataSets:LineDataSet(dataPoints:points),metadata:metadata,chartStyle: chartStyle)
            LineChart(chartData: data )
                .id(data.id)
                .touchOverlay(chartData: data,  specifier: "%.3f$")
                .xAxisGrid(chartData: data)
                .yAxisGrid(chartData: data)
                .xAxisLabels(chartData: data)
                .yAxisLabels(chartData: data)
                .infoBox(chartData: data)
                .headerBox(chartData: data)
                
                //.legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                //.frame(minWidth: 150, maxWidth: 700, minHeight: 150, idealHeight: 250, maxHeight: 1000, alignment: .center)
            Spacer()
            Picker("Chart period", selection: $selectedPeriod) {
                ForEach(Period.allCases, id: \.self) { item in
                    Text(item.displayName).tag(item)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: selectedPeriod){
                value in
                vm.loadChart(period: value)
                
            }
        }
    }
}
