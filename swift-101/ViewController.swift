//
//  ViewController.swift
//  swift-101
//
//  Created by NUEVO DEV01 on 8.06.2020.
//  Copyright © 2020 NUEVO DEV01. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var products = [Product]()
    let cellId = "ProductTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib.init(nibName: cellId, bundle: nil ), forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
        for _ in 1...8{
            let element = Product(name: "palanga", price: 19.99, amount: 2)!
            products.append(element)
            
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductTableViewCell
        cell.selectionStyle = .none
        let item = products[indexPath.row]
        cell.productName.text = item.name
        cell.amountTF.text = String(item.amount)
        cell.priceTF.text = String(item.price)
        return cell
    }
    
    func numberOfSections(in tableView:UITableView) -> Int {
        return 1
    }
    
}

