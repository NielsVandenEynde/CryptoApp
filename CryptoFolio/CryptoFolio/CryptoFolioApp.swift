//
//  CryptoFolioApp.swift
//  CryptoFolio
//
//  Created by Niels Van den Eynde on 25/12/2021.
//

import SwiftUI

@main
struct CryptoFolioApp: App {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ParentView().environmentObject(viewRouter)
        }
    }
}
