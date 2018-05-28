//
//  Elementos.swift
//  Iberfibra
//
//  Created by David Martín Sáiz on 25/5/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//


class Elementos{

    class Panel{
        var nombre: String?
        var id: String?
        var botones: [BotonPanel]?
    }
    
    class BotonPanel{
        var estado: Bool?
        var color: String? //String con el hexadecimal del color.
        var comando: String?
    }
    
    class DispositivoBluetooth{
        var nombre: String?
        var identificador: String?
        var UUID: String?
        var estado: String?
    }

}
