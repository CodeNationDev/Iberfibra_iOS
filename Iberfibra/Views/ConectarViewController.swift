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
    var listaNombres:[String]?
    var listaIdentificadores:[String]?
    var listaPripherals:[CBPeripheral]?
    var dic : [String : Any] = Dictionary()
    
    
    
    @IBOutlet weak var tbDevices: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbDevices.dataSource = self
        tbDevices.delegate = self
        
        
        listaDispositivos = [Elementos.DispositivoBluetooth]()
        listaIdentificadores = [String]()
        listaNombres = [String]()
        listaPripherals = [CBPeripheral]()
        dic[CBCentralManagerOptionShowPowerAlertKey] = false
        manager = CBCentralManager(delegate: self, queue: nil, options: dic)
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func EscanearDispositivos(_ sender: Any) {
        manager = CBCentralManager(delegate: self, queue: nil)
        centralManagerDidUpdateState(manager)
        
    }
    
    //Busca dispositivos bluetooth.
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == CBManagerState.poweredOn {
            central.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:true])
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
        
        listaNombres?.append(peripheral.name ?? "Unknown Device")
        
        
        
        if(peripheral.state.rawValue == 0){
            elemento.estado = "desconectado"
        }
        else{
            elemento.estado = "conectado"
        }
        
        if(!(listaIdentificadores?.contains(peripheral.identifier.uuidString))!){
        listaIdentificadores?.append(peripheral.identifier.uuidString)
        listaDispositivos?.append(elemento)
        listaPripherals?.append(peripheral)
        tbDevices.reloadData()
        }
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
        manager.connect(listaPripherals![indexPath.row], options: [CBConnectPeripheralOptionNotifyOnDisconnectionKey : true])
    }
    
   

    
    
}
