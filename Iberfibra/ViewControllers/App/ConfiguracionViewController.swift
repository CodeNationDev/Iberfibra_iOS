//
//  ConfiguracionViewController.swift
//  Iberfibra
//
//  Created by David Martín Sáiz on 23/5/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import UIKit

class ConfiguracionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tvConfig: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tvConfig.delegate = self
        tvConfig.dataSource = self
        
        let nib = UINib(nibName: "NumberOfItemsRow", bundle: nil)
        tvConfig.register(nib, forCellReuseIdentifier: "numberOfItemsCell")
        
    }
    
    //Función que cuenta los elementos de la lista.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    //Función que configura la celda y la devuelve.
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let numberCell = tableView.dequeueReusableCell(withIdentifier: "numberOfItemsCell", for: indexPath) as! NumberOfItemsControllerCell
            
            numberCell.setTitle(title: "Número de botones")
            numberCell.setNumber(number: 4)
            numberCell.setStepperValue(value: 4)
            numberCell.setImage(assetName: "panelIcon")
            
            return numberCell
            
        case 1:
            let genericCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
            
            genericCell.textLabel?.text = "Colores y comandos"
            genericCell.imageView?.image = UIImage(imageLiteralResourceName: "colors")
            genericCell.accessoryType = .disclosureIndicator
            return genericCell
            
        default:
            let genericCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
            
            genericCell.textLabel?.text = "Opción 1"
            genericCell.imageView?.image = UIImage(imageLiteralResourceName: "bluetoth")
            
            return genericCell
        }
        
    }
    
    //Función que obtiene el objeto sobre el que pulsamos de la tabla. Conecta el dispositivo Bluetooth.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.row {
        case 0:
            print("Has clickado el elemento 1")
        case 1:
            let configColorCommands = ConfigColorsAndCommandsController(nibName: "ConfigColorsAndCommands", bundle: nil)
            
            navigationController?.pushViewController(configColorCommands, animated: true)
            
        default:
            print("No has clicado")
            
        }
        
        
        
    }


}
