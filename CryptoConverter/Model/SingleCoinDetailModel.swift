//
//  SingleCoinDetailModel.swift
//  CryptoConverter
//
//  Created by Hajar on 23/02/2021.
//

import Foundation

// MARK: - CoinDetail
struct CoinDetail: Codable {
    let message: String?
    let type: Int?
    let data: [SingleCoin]?
    
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case type = "Type"
        case data = "Data"
    }
}


// MARK: - singleCoin
struct SingleCoin: Codable {
//    TODO: Define propoer type structures
//    let coinInfo: CoinInfo?
//    let raw: Raw?
//    let display: Display?
    
    
    let coinInfo: String?
    let raw: String?
    let display: String?
    
    enum CodingKeys: String, CodingKey {
        case coinInfo = "CoinInfo"
        case raw = "RAW"
        case display = "DISPLAY"
    }
}







