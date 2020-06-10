//
//  Product.swift
//  swift-101
//
//  Created by NUEVO DEV01 on 10.06.2020.
//  Copyright © 2020 NUEVO DEV01. All rights reserved.
//

import Foundation

class Product{
    var name:String
    var price:Double
    var amount: Int
    
    required init?(name:String, price:Double, amount:Int){
        self.name = name
        self.price = price
        self.amount = amount
    }
}
