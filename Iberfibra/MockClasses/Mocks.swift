//
//  Mocks.swift
//  Iberfibra
//
//  Created by david.martin.saiz on 13/11/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation

func mockPanel() -> Elementos.Panel {
    
    let panel = Elementos.Panel()
    panel.botones = mockBotones()
    panel.id = "0001"
    panel.nombre = "mockPanel"
    
    
    return panel

}

func mockBotones() -> [Elementos.BotonPanel] {
    
    let botones = [Elementos.BotonPanel.init(),
                   Elementos.BotonPanel.init(),
                   Elementos.BotonPanel.init()]
    
    return botones
}


