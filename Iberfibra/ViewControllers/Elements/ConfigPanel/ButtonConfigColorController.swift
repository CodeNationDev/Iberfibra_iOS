//
//  ButtonConfigColorController.swift
//  Iberfibra
//
//  Created by david.martin.saiz on 27/11/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation
import UIKit


class ButtonConfigColorController: UITableViewCell {
    
    @IBOutlet weak var lbColor: UILabel!
    @IBOutlet weak var lbDescripcion: UILabel!
    @IBOutlet weak var lbComando: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCellColor(color: UIColor){
        
        self.lbColor.backgroundColor = color
        
    }
    
    func setDescripcion(descripcion: String){
        
        self.lbDescripcion.text = descripcion
        
    }
    
    func setComando(comando: String){
        
        self.lbComando.text = comando
        
    }
    
}
