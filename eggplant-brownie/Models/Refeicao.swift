//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Lúcio Silveira on 06/05/22.
//

import UIKit

class Refeicao: NSObject {
    let nome:String;
    let felicidade:Int;
    let itens: Array<Item>;
    
    init(nome:String,felicidade:Int, itens:Array<Item> = []) {
        self.nome = nome;
        self.felicidade = felicidade;
        self.itens = itens;
    }
    
    func toString()->String{
        return "nome:\(nome) felicidade:\(felicidade)";
    }
    
    func getTotalCalorias()-> Double{
        var total:Double = 0;
        for item in itens{
            total += item.calorias;
        }
        return total;
    }
}
