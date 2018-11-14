//
//  UserDefaults.swift
//  Iberfibra
//
//  Created by David Martín Sáiz on 24/5/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation

    //Función para salvar un objeto clave/valor en string.
    func salvarObjetoTexto(clave: String, valor: String){
        UserDefaults.standard.set(clave,forKey: valor)
    }

    //Función para recuperar un objeto clave/valor en string.
    func recuperaObjetoTexto(clave: String) -> String? {
        
        return UserDefaults.standard.string(forKey: clave)
        
    }

    //Función para salvar un panel en UserDefaults
    func salvarPanel(clave: String, objetoPanel: Elementos.Panel) {

        //TODO: Implementar el salvado en UserDefaults porque me da error.
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: objetoPanel)
        userDefaults.set(encodedData, forKey: clave)
        userDefaults.synchronize()
        
    }

    //Función para recuperar un panel de UserDefaults
func recuperarPanel(nombre: String) throws -> Elementos.Panel {
        
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.object(forKey: nombre) as! Data
        let panel = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! Elementos.Panel
        
        return panel
    }
