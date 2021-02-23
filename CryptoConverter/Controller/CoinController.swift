//
//  ViewController.swift
//  CryptoConverter
//
//  Created by Hajar on 19/02/2021.
//

import UIKit
import SDWebImage

class CoinController: UIViewController {
    
//    MARK: Variables
    var coinViewModelArray = [CoinViewModel]()
    var conversionRate: Double?
    
    
//    MARK: Outlets
    @IBOutlet weak var coinTableView: UITableView!
    
    
//    MARK: Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
        
        
        NetworkManager.shared.fetchAllCoins{ (coinsArray) in
            DispatchQueue.main.async {
                self.coinViewModelArray = coinsArray.map({return CoinViewModel(coinModel: $0)})
                
                self.coinTableView.reloadData()
            }
        }
        
        
        // MARK: ToDebug
        
//        NetworkManager.shared.fetchSingleCoinVolumeDetails(toSymbol: "USD") { (volume24) in
//            let volume24 = volume24
//
//        }
        
        
    }
    
//    MARK: Functions
    func setupUIElements(){
        coinTableView.separatorStyle = .none
        coinTableView.showsVerticalScrollIndicator = false
        
    }
    
//    MARK: Segue Management
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CoinDetailViewController {
            destination.coin = coinViewModelArray[(coinTableView.indexPathForSelectedRow?.row)!]
        
            destination.conversionRate = conversionRate
        }
    }
    
}
    
    
//    MARK: - Stubs
extension CoinController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return coinViewModelArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = coinTableView.dequeueReusableCell(withIdentifier: "coinCell") as! CoinTableViewCell
            
            cell.coinFullNameLabel.text = coinViewModelArray[indexPath.row].fullName

            cell.coinSymbolLabel.text = "Symbol : "+coinViewModelArray[indexPath.row].symbol
            
            
            NetworkManager.shared.fetchSingleSymbolConversion(
                fromSymbol: coinViewModelArray[indexPath.row].symbol,
                toSymbol: "eur") { (ConversionResponseModel) in
                
                self.conversionRate = ConversionResponseModel.value
                
                DispatchQueue.main.async {
                    cell.coinConversionLabel.text = "Conversion : " + String(self.conversionRate!) + " €"
                }
                
            }
            
            
            
            let coinImageURL = URL(string: BASE_IMAGE_URL!.absoluteString + coinViewModelArray[indexPath.row].imageURL!)
            
            cell.coinImage.sd_setImage(with: coinImageURL
            , placeholderImage: UIImage(named:"placeHolder"))
            
            
            cell.coinView.layer.cornerRadius = cell.coinView.frame.height / 2
            cell.imageView?.layer.cornerRadius = (cell.imageView?.frame.height)! / 2
            
            cell.coinImage?.layer.cornerRadius = (cell.coinImage?.frame.height)! / 2
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showCoinDetailSegue", sender: self)
            
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
   
