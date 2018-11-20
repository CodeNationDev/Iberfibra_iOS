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
        
    }

    
    //Botón que inicia el escaneo de dispositivos Bluetooth.
    @IBAction func EscanearDispositivos(_ sender: Any) {
        manager = CBCentralManager(delegate: self, queue: nil)
        centralManagerDidUpdateState(manager)
        
    }
    
    //MARK: -
    //MARK: Funciones Bluetooth
    //MARK: -
    //Inicia el escaneo comprobando el estado del bluetooth
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == CBManagerState.poweredOn {
            central.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:true])
        } else {
            print("Bluetooth not available.")
        }
    }
    
    //Función que se ejecuta cada vez que se encuentra un dispositivo Bluetooth
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
    
    //MARK: -
    //MARK: Funciones de TableView
    //MARK: -
    //Función que cuenta los elementos de la lista.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaDispositivos!.count
    }
    
    //Función que configura la celda y la devuelve.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text  = listaDispositivos![indexPath.row].nombre
        
        return cell
    }
    
    //Función que obtiene el objeto sobre el que pulsamos de la tabla. Conecta el dispositivo Bluetooth.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listaDispositivos![indexPath.row].nombre!)
        manager.connect(listaPripherals![indexPath.row], options: [CBConnectPeripheralOptionNotifyOnDisconnectionKey : true])
        manager.stopScan()
        
        
        //let bytes : [UInt8] = [ 0x52, 0x13, 0x00, 0x56, 0xFF, 0x00, 0x00, 0x00, 0xAA ]
       // let data = Data(bytes:bytes)
        
    }
    
    
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        
        print("Central subscribed to characteristic")
        
    }
    
    func centralManager(
        central: CBCentralManager,
        didConnectPeripheral peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
    }
    
    func writeValue(_ data: Data,
                    for characteristic: CBCharacteristic,
                    type: CBCharacteristicWriteType){}
    
    
    // Called when it succeeded

    
    
    
    // Called when it failed
    func centralManager(_ central: CBCentralManager,
                        didFailToConnect peripheral: CBPeripheral,
                        error: Error?){
        
        print("failed…")
    }
    
    
    
    
}
