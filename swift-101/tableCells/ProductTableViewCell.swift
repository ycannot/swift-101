//
//  ProductTableViewCell.swift
//  swift-101
//
//  Created by NUEVO DEV01 on 10.06.2020.
//  Copyright © 2020 NUEVO DEV01. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    //MARK: Outlets
    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var priceTF: UITextField!
    
    var delegate:ShoppingListDelegate?
    var index:Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        priceTF.delegate = self
        amountTF.delegate = self
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

extension ProductTableViewCell: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let currentIndex = index{
            switch textField {
            case amountTF:
                self.delegate?.recalculate(rowIndex:currentIndex, amount:Int(self.amountTF.text ?? "") ?? 0, price:Double(self.priceTF.text ?? "") ?? 0)
            case priceTF:
                self.delegate?.recalculate(rowIndex:currentIndex, amount:Int(self.amountTF.text ?? "") ?? 0, price:Double(self.priceTF.text ?? "") ?? 0)
            default:
                self.delegate?.recalculate(rowIndex:currentIndex, amount:Int(self.amountTF.text ?? "") ?? 0, price:Double(self.priceTF.text ?? "") ?? 0)
            }
        }
        return true
    }
}
