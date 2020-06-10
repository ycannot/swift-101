//
//  ProductTableViewCell.swift
//  swift-101
//
//  Created by NUEVO DEV01 on 10.06.2020.
//  Copyright © 2020 NUEVO DEV01. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var priceTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
