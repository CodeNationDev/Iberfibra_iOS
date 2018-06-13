//
//  PanelViewController.swift
//  Iberfibra
//
//  Created by David Martín Sáiz on 23/5/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import UIKit
import CoreBluetooth

class PanelViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    override func viewDidAppear(_ animated: Bool){
        
        if UserDefaultsFunctions().recuperaObjetoTexto(clave: "panel") != nil{
            
        }
        else{
            let alert: UIAlertController = UIAlertController(title: "Aviso",message: "No se ha encontrado panel vinculado, por favor, vaya a la pestaña 'Conectar y vincule uno'", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Vamos!", style: .default, handler: { action in
                self.tabBarController?.selectedIndex = 2
            }))
            
            self.present(alert,animated: true)
        }
    }

}
