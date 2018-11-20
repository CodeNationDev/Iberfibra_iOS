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
        
    }
    
    //Función que cuenta los elementos de la lista.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    //Función que configura la celda y la devuelve.
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        
        cell.textLabel?.text = "Opción 1"
        cell.imageView?.image = UIImage(imageLiteralResourceName: "bluetooth")
        
        return cell
    
    }
    
    //Función que obtiene el objeto sobre el que pulsamos de la tabla. Conecta el dispositivo Bluetooth.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Has clickado el elemento " +  String(indexPath.row))
        
    }


}
