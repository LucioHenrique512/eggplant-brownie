//
//  Item.swift
//  eggplant-brownie
//
//  Created by Lúcio Silveira on 06/05/22.
//

import UIKit

class Item: NSObject {
    let nome: String;
    let calorias: Double;
    
    init(nome:String,calorias:Double){
        self.nome = nome;
        self.calorias = calorias;
    }
}
