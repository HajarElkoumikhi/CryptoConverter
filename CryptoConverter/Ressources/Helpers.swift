//
//  Helpers.swift
//  CryptoConverter
//
//  Created by Hajar on 21/02/2021.
//

import Foundation

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

func formConversionURL(sourceCurrency: String, destinationCurrency:String) -> String {
//                      Syntax
//    BASE : https://min-api.cryptocompare.com/data/price?fsym=
//    SourceCuurency : BTC
//    Link : &tsyms=
//    DestinationCurrency : EUR
    
    
    let conversionURL = CRYPTO_CONVERSION_BASE + sourceCurrency + CRYPTO_CONVERSION_LINK + destinationCurrency
    
    return conversionURL
}
