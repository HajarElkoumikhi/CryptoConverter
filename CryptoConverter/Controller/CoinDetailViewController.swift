//
//  CoinDetailViewController.swift
//  CryptoConverter
//
//  Created by Hajar on 20/02/2021.
//

import UIKit

class CoinDetailViewController: UIViewController {

    var coin: CoinViewModel?
    var conversionRate: Double?
    
//    MARK: Outlets
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinFullnameLabel: UILabel!
    @IBOutlet weak var coinSymbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var coinAmountField: UITextField!
    @IBOutlet weak var conversionResultLabel: UILabel!
    
//    MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCoinDetails()
        
    }
    
    private func setupCoinDetails(){
        
        if let imageURLUnwrapped = coin?.imageURL {
            
            let coinImageURL = URL(string: BASE_IMAGE_URL!.absoluteString + imageURLUnwrapped)
            
            self.coinImage.sd_setImage(with: coinImageURL
                        , placeholderImage: UIImage(named:"placeHolder"))
        }
        
        self.coinNameLabel.text = "Name : " + coin!.name
        self.coinFullnameLabel.text = "Fullname : " + coin!.fullName
        self.coinSymbolLabel.text = "Symbol : " + coin!.symbol
        self.priceLabel.text = "Price : " + String(conversionRate!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        coinAmountField.resignFirstResponder()
        
        let conversionValue = Double(coinAmountField.text!)! / conversionRate!
        conversionResultLabel.text = "I will have " + String(conversionValue) + " of crypto money!"
    }
    

}

extension CoinDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
