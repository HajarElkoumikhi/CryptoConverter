//
//  CoinModel.swift
//  CryptoConverter
//
//  Created by Hajar on 20/02/2021.
//

import Foundation

struct CoinModel: Codable {
    let id, url: String
    let imageURL: String?
    let name, symbol, coinName, fullName: String
    
    
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case url = "Url"
        case imageURL = "ImageUrl"
        
        case name = "Name"
        case symbol = "Symbol"
        case coinName = "CoinName"
        case fullName = "FullName"
        
    }
}






