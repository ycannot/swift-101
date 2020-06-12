//
//  AddItemViewController.swift
//  swift-101
//
//  Created by NUEVO DEV01 on 12.06.2020.
//  Copyright © 2020 NUEVO DEV01. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    var delegate: NewItemDelegate?
    
    //MARK: Outlets
    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var productNameTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    @IBAction func doneAction(_ sender: Any) {
        if amountTF.text != "" && productNameTF.text != "" && priceTF.text != "" {
            delegate?.addItem(newItem: Product(name: productNameTF.text!, price: Double(priceTF.text!) ?? 0, amount: Int(amountTF.text!) ?? 0)!)
            self.dismiss(animated: true)
        }
        else{
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen tüm alanları doldurunuz.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert,animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
