//
//  CoinDetailView.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 30/12/2021.
//

import SwiftUI

struct CoinDetailView: View {
    var body: some View {
        VStack{
            LineChartView()
        }
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView()
    }
}

struct LineChartView: View {
    var body: some View {
        VStack{

            Text("Chart")

        }
    }
}
