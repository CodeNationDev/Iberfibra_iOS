//
//  ConfigColorsAndCommands.swift
//  Iberfibra
//
//  Created by david.martin.saiz on 22/11/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation
import UIKit

class ConfigColorsAndCommandsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvConfigColorCommands: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvConfigColorCommands.delegate = self
        tvConfigColorCommands.dataSource = self
        
        let nib = UINib(nibName: "ButtonConfig", bundle: nil)
        tvConfigColorCommands.register(nib, forCellReuseIdentifier: "ButtonConfig")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonConfig", for: indexPath) as! ButtonConfigColorController
        
        cell.setCellColor(color: UIColor.yellow)
        cell.setDescripcion(descripcion: "Abrir compuerta")
        cell.setComando(comando: "#FFE4C6")
        
        return cell
    }
    
}
