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
    
    @IBOutlet weak var panelOperativo: BotoneraPanelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panel = mockPanel()
        salvarPanel(clave: panel.nombre!, objetoPanel: panel)
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        var panel = Elementos.Panel.init()
        do{
            let panel = try recuperarPanel(nombre: "mockPanel")
            
        } catch {
            
            let alert: UIAlertController = UIAlertController(title: "Aviso",message: "No se ha encontrado panel vinculado, por favor, vaya a la pestaña 'Conectar y vincule uno'", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Vamos!", style: .default, handler: { action in
                self.tabBarController?.selectedIndex = 2
            }))
            
            self.present(alert,animated: true)
        }
        
        
    }

}
