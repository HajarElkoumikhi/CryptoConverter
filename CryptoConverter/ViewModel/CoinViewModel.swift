//
//  CoinViewModel.swift
//  CryptoConverter
//
//  Created by Hajar on 23/02/2021.
//

import Foundation

struct CoinViewModel {
    let id, url: String
    let imageURL: String?
    let name, symbol, coinName, fullName: String
    
    init(coinModel: CoinModel) {
        self.id = coinModel.id
        self.url = coinModel.url
        self.imageURL = coinModel.imageURL
        self.name = coinModel.name
        self.symbol = coinModel.symbol
        self.coinName = coinModel.coinName
        self.fullName = coinModel.fullName
    }
}
