//
//  LiveVC.swift
//  PaperTrading
//
//  Created by Marcus Ng on 11/24/17.
//  Copyright © 2017 Marcus Ng. All rights reserved.
//

import UIKit

class LiveVC: UIViewController {

    let stocks = ["AAPL", "AMZN", "BABA", "EMQQ", "FB", "GOOG", "NVDA"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    @objc func reloadTable() {
        self.tableView.reloadData()
    }

}

extension LiveVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LiveStockCell") as? LiveStockCell else { return UITableViewCell() }
        cell.configure(ticker: stocks[indexPath.row])
        return cell
    }
    
}
