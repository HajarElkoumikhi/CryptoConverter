//
//  NetworkResponseModel.swift
//  CryptoConverter
//
//  Created by Hajar on 21/02/2021.
//

import Foundation

struct CoinsNetworkResponseModel: Codable {
    let response, message: String
    let data: [String: CoinModel]
    
    let baseImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case message = "Message"
        case data = "Data"
        case baseImageURL = "BaseImageUrl"
    }
}
