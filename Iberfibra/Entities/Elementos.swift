//
//  Elementos.swift
//  Iberfibra
//
//  Created by David Martín Sáiz on 25/5/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//
import Foundation

class Elementos{

    @objc(_TtCC9Iberfibra9Elementos5Panel)class Panel: NSObject, NSCoding {
        var nombre: String?
        var id: String?
        var botones: [BotonPanel]?
        
        init(nombre: String, id: String, botones: [Elementos.BotonPanel]){
            self.nombre = nombre
            self.id = id
            self.botones = botones
        }
        
        override init(){
            self.nombre = ""
            self.id = ""
            self.botones = [Elementos.BotonPanel.init(),Elementos.BotonPanel.init()]
        }
        
        required convenience init(coder aDecoder: NSCoder) {
            let nombre = aDecoder.decodeObject(forKey: "nombre") as! String
            let id = aDecoder.decodeObject(forKey: "id") as! String
            let botones = aDecoder.decodeObject(forKey: "botones") as! [Elementos.BotonPanel]
            self.init(nombre: nombre, id: id, botones: botones)
        }
        
        func encode(with aCoder: NSCoder) {
            aCoder.encode(id, forKey: "id")
            aCoder.encode(nombre, forKey: "nombre")
            aCoder.encode(botones, forKey: "botones")
        }
    }
    
    @objc(_TtCC9Iberfibra9Elementos10BotonPanel)class BotonPanel: NSObject, NSCoding{
        var estado: Bool?
        var color: String? //String con el hexadecimal del color.
        var descripcion: String?
        var comando: String?
        
        init(estado: Bool, color: String, comando: String, descripcion: String){
            self.estado = estado
            self.color = color
            self.comando = comando
            self.descripcion = descripcion
            
        }
        
        override init(){
            self.estado = true
            self.color = "#FFEFF"
            self.comando = ""
            self.descripcion = "Boton 4"
            
            
            
        }
        
        required convenience init(coder aDecoder: NSCoder) {
            let estado = aDecoder.decodeObject(forKey: "estado") as! Bool
            let color = aDecoder.decodeObject(forKey: "color") as! String
            let comando = aDecoder.decodeObject(forKey: "comando") as! String
            let descripcion = aDecoder.decodeObject(forKey: "descripcion") as! String
            self.init(estado: estado, color: color, comando: comando, descripcion: descripcion)
        }
        
        func encode(with aCoder: NSCoder) {
            aCoder.encode(estado, forKey: "estado")
            aCoder.encode(color, forKey: "color")
            aCoder.encode(comando, forKey: "comando")
            aCoder.encode(comando, forKey: "descripcion")
        }
    }
    
    class DispositivoBluetooth{
        var nombre: String?
        var identificador: String?
        var UUID: String?
        var estado: String?
        
        init(){
            self.nombre = ""
            self.identificador = ""
            self.UUID = ""
            self.estado = ""
        }
    }

}
