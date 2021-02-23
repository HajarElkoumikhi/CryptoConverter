//
//  NetworkManager.swift
//  CryptoConverter
//
//  Created by Hajar on 20/02/2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    

    func fetchAllCoins (completion: @escaping ([CoinModel]) -> ()) {
        var coinModelArray = [CoinModel]()
        
        guard let url = URL(string: ALL_COINS_URL) else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch data with error: ", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            
            do {
                let networkResponse = try
                    JSONDecoder().decode(CoinsNetworkResponseModel.self, from: data)
                
                let baseImageURL = networkResponse.baseImageURL
                BASE_IMAGE_URL = URL(string: baseImageURL)
                
                let coinsDictionary = networkResponse.data
                coinModelArray = Array(coinsDictionary.values)
                
                completion(coinModelArray)
            
            }catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
        }.resume()
        
    }
    
    
    func fetchSingleSymbolConversion(fromSymbol: String, toSymbol: String,completion: @escaping (CurrencyResponseModel) -> ()){
        
        let conversionURL = formConversionURL(sourceCurrency: fromSymbol, destinationCurrency: toSymbol)
        
        guard let url = URL(string: conversionURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch data with error: ", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
    
            do {
                
                do {
                    let straightConversion = try JSONDecoder().decode(CurrencyResponseModel.self, from: data)
                    completion(straightConversion)
                } catch  {
                    let alternativeConversion = try JSONDecoder().decode(ConversionErrorResponseModel.self, from: data)
                    NetworkManager.shared.fetchSingleSymbolConversion(fromSymbol: "BTC", toSymbol: toSymbol) { (CurrencyResponseModel) in
                        completion(CurrencyResponseModel)
                    }
                }
                
            } catch {
                print(error)
            }
            
        }.resume()
    
    }
    
//
//    func fetchSingleCoinVolumeDetails (toSymbol: String, completion: @escaping (Double?) -> ()) {
//
//        var coinModelArray = [CoinModel]()
//
//        let coinDetailURL = SINGLE_COIN_DETAIL + toSymbol
////        print(coinDetailURL)
//        guard let url = URL(string: coinDetailURL) else { return }
//
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print("Failed to fetch data with error: ", error.localizedDescription)
//                return
//            }
//
//            guard let data = data else { return }
//
//
//            do {
//                let coinDetail = try
//                    JSONDecoder().decode(CoinDetail.self, from: data)
//
//                let singleCoingDetailArray = coinDetail.data
//                let singleCoin = singleCoingDetailArray![0]
//                let rawDetail = singleCoin.raw
////                let volume24 = rawDetail?.btc?.volume24Hour
//
//                completion(volume24)
//
//
//
//            }catch let jsonErr {
//                print("Error serializing json:", jsonErr)
//            }
//
//        }.resume()
//
//    }
}



