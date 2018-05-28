//
//  ConectarViewController.swift
//  Iberfibra
//
//  Created by David Martín Sáiz on 23/5/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import UIKit
import CoreBluetooth

class ConectarViewController: UIViewController, CBCentralManagerDelegate,
CBPeripheralDelegate, UITableViewDataSource, UITableViewDelegate {

    var manager:CBCentralManager!
    var peripheral:CBPeripheral!
    var listaDispositivos:[Elementos.DispositivoBluetooth]?
    
    
    @IBOutlet weak var tbDevices: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbDevices.dataSource = self
        tbDevices.delegate = self
        
        listaDispositivos = [Elementos.DispositivoBluetooth]()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func EscanearDispositivos(_ sender: Any) {
        manager = CBCentralManager(delegate: self, queue: nil)
        centralManagerDidUpdateState(manager)
        
    }
    
    //Busca dispositivos bluetooth.
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == CBManagerState.poweredOn {
            central.scanForPeripherals(withServices: nil)
        } else {
            print("Bluetooth not available.")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral)
        
        let elemento = Elementos.DispositivoBluetooth()
        elemento.identificador = peripheral.identifier.description
        elemento.nombre = peripheral.name ?? "Unknown Device"
        elemento.UUID = peripheral.identifier.uuidString
        if(peripheral.state.rawValue == 0){
            elemento.estado = "desconectado"
        }
        else{
            elemento.estado = "conectado"
        }
        
        
        listaDispositivos?.append(elemento)
        
        tbDevices.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaDispositivos!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text  = listaDispositivos![indexPath.row].nombre
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listaDispositivos![indexPath.row].nombre!)
    }
    
   

    
    
}
