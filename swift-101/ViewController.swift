//
//  ViewController.swift
//  swift-101
//
//  Created by NUEVO DEV01 on 8.06.2020.
//  Copyright © 2020 NUEVO DEV01. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ShoppingListDelegate, NewItemDelegate {
    
    
    var products = [Product]()
    let cellId = "ProductTableViewCell"
    var isEditModeEnabled = false
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBAction func addClickedAction(_ sender: Any) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "addItemVC") as! AddItemViewController
        next.delegate = self
        self.present(next, animated: true, completion: nil)
    }
    @IBAction func editClickedAction(_ sender: UIBarButtonItem) {
        for i in 0...tableView.numberOfSections-1{
            for j in 0...tableView.numberOfRows(inSection: i)-1{
                let cell = tableView.cellForRow(at: NSIndexPath(row: j, section: i) as IndexPath) as! ProductTableViewCell
                if isEditModeEnabled {
                    cell.rowDelBtn.isHidden = true
                    
                }
                else{
                    cell.rowDelBtn.isHidden = false
                    
                }
            }
        }
        isEditModeEnabled = !isEditModeEnabled
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib.init(nibName: cellId, bundle: nil ), forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        calculateSum(productList: products)
        
    }
    
    func calculateSum(productList:[Product]){
        var sum:Double = 0
        for i in productList{
            sum += (Double(i.amount) * i.price)
        }
        self.totalPrice.text = String(format: "%.2f", sum)
    }
    
    //MARK: Protocol Functions
    
    //---------- UITableViewDelegate & UITableViewDataSource implementation functions ---------------
    
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
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func numberOfSections(in tableView:UITableView) -> Int {
        return 1
    }
    
    //---------- ShoppingListDelegate protocol implementation functions -------------
    
    func recalculate(rowIndex:Int, amount:Int, price:Double) {
        products[rowIndex].amount = amount
        products[rowIndex].price = price
        var sum:Double = 0
        for i in products{
            sum += (Double(i.amount) * i.price)
        }
        totalPrice.text = String(format: "%.2f", sum)
    }
    func deleteRow(rowIndex: Int) {
        products.remove(at: rowIndex)
        UIView.transition(with: tableView, duration: 0.5, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
        calculateSum(productList: products)
    }
    
    //---------- NewItemDelegate protocol implementation functions ------------------
    
    func addItem(newItem:Product) {
        products.append(newItem)
        UIView.transition(with: tableView, duration: 0.5, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
        calculateSum(productList: products)
    }
    
    
    
    
}

//MARK: Protocols
//----------- Protocols --------------

protocol ShoppingListDelegate {
    func recalculate(rowIndex:Int, amount:Int, price:Double)
    func deleteRow(rowIndex:Int)
}

protocol NewItemDelegate {
    func addItem(newItem:Product)
}

