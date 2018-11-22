//
//  NumberOfItemsController.swift
//  Iberfibra
//
//  Created by david.martin.saiz on 20/11/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation
import UIKit

class NumberOfItemsControllerCell: UITableViewCell {
    
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var number: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stepper.maximumValue = 16
        
    }
    @IBAction func cuantityStepperAction(_ sender: UIStepper) {
        
        self.number.text = Int(sender.value).description
        
    }
    
    func setImage(assetName: String){
        
        self.imageView?.image = UIImage(imageLiteralResourceName: assetName)
        
    }
    
    func setTitle(title: String){
        
        self.title.text = title
        
    }
    
    func setNumber(number: Int){
    
        self.number.text = String(number)
        
    }
    
    func setStepperValue(value: Int){
        
       self.stepper.value = Double(value)
        
    }

    
    

    

}
