//
//  ParentView.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 26/12/2021.
//

import SwiftUI

struct ParentView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        switch viewRouter.currentPage {
            case .page1:
                LoginView()
            case .page2:
                CoinListView()
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
