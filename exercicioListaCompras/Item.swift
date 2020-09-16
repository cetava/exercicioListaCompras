//
//  Item.swift
//  exercicioListaCompras
//
//  Created by Cesar A. Tavares on 9/16/20.
//  Copyright © 2020 Cesar A. Tavares. All rights reserved.
//

import Foundation

class Item {
    var produto: String
    var quantidade: Int
    
    init(produto: String, quantidade: Int) {
        self.produto = produto
        self.quantidade = quantidade
    }
}
