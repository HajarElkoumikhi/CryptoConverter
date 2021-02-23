//
//  ConversionNetworkResponseModel.swift
//  CryptoConverter
//
//  Created by Hajar on 21/02/2021.
//

import Foundation

struct CurrencyResponseModel: Codable {
    typealias DestinationCurrency = String
    
    let currency : DestinationCurrency
    let value : Double
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dict = try container.decode([String:Double].self)
        guard let key = dict.keys.first else {
            throw NSError(domain: "Decoder", code: 0, userInfo: [:])
        }
        currency = key
        value = dict[key] ?? -1
    }
}


struct ConversionErrorResponseModel: Codable {
    let response, message: String
    let hasWarning: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case message = "Message"
        case hasWarning = "HasWarning"
    }
}


enum ConversionResponseModel: Decodable {
    case currency(CurrencyResponseModel)
    case errorMessage(ConversionErrorResponseModel)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            let data = try container.decode(CurrencyResponseModel.self)
            self = .currency(data)
        } catch  {
            let data = try container.decode(ConversionErrorResponseModel.self)
            self = .errorMessage(data)
        }
    }
}




