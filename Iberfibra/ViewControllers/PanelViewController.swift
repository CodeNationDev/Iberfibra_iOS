//
//  PanelViewController.swift
//  Iberfibra
//
//  Created by David Martín Sáiz on 23/5/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import UIKit
import CoreBluetooth

class PanelViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
 
    
    @IBOutlet weak var cvPanelOperativo: UICollectionView!
    var panelOperativo = Elementos.Panel.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panel = mockPanel()
        salvarPanel(clave: panel.nombre!, objetoPanel: panel)
        
        
        
        cvPanelOperativo.delegate = self
        cvPanelOperativo.dataSource = self
        
        cvPanelOperativo.register(UINib.init(nibName: "CellButton", bundle: nil), forCellWithReuseIdentifier: "cellButton")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        if let panel = try recuperarPanel(nombre: "mockPanel"){
            panelOperativo = panel
        } else {
            
            let alert: UIAlertController = UIAlertController(title: "Aviso",message: "No se ha encontrado panel vinculado, por favor, vaya a la pestaña 'Conectar y vincule uno'", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Vamos!", style: .default, handler: { action in
                self.tabBarController?.selectedIndex = 2
            }))
            
            self.present(alert,animated: true)
            
        }
            
        
        }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var buttonCount = 0
        
        if let panel = recuperarPanel(nombre: "mockPanel") {
            buttonCount = (panel.botones?.count)!
        }
        
        return buttonCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = cvPanelOperativo.dequeueReusableCell(withReuseIdentifier: "cellButton", for: indexPath) as! CellButtonCollectionViewCell
        
//        cell.configure(nombre: panelOperativo.botones![indexPath.row].comando! , comando: panelOperativo.botones![indexPath.row].comando!)
        
        
        return cell
    }
    }


