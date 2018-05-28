//
//  UserDefaults.swift
//  Iberfibra
//
//  Created by David Martín Sáiz on 24/5/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation

class UserDefaultsFunctions {


    func salvarObjetoTeto(clave: String, valor: String){
        UserDefaults.standard.set(clave,forKey: valor)
    }

    func recuperaObjetoTexto(clave: String) -> String? {
        
        return UserDefaults.standard.string(forKey: clave)
        
    }
}
