//
//  CoinTableViewCell.swift
//  CryptoConverter
//
//  Created by Hajar on 21/02/2021.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
//    MARK: - Outlets
    @IBOutlet weak var coinView: UIView!
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinFullNameLabel: UILabel!
    @IBOutlet weak var coinSymbolLabel: UILabel!
    @IBOutlet weak var coinConversionLabel: UILabel!
    
    
//    MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
