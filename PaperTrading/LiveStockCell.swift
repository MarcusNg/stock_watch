//
//  LiveStockCell.swift
//  PaperTrading
//
//  Created by Marcus Ng on 11/24/17.
//  Copyright © 2017 Marcus Ng. All rights reserved.
//

import UIKit
import Alamofire

class LiveStockCell: UITableViewCell {

    @IBOutlet weak var tickerLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    func configure(ticker: String) {
        self.tickerLbl.text = ticker
        
        let url = "https://api.iextrading.com/1.0/stock/\(ticker)/quote"
        Alamofire.request(url).responseJSON { (response) in
            if let json = response.result.value as? [String:Any] {
                let companyName = json["companyName"] as! String
                guard let price = json["latestPrice"] else { return }
                self.companyLbl.text = companyName
                self.priceLbl.text = "$\(price)"
            }
        }
    }

}
