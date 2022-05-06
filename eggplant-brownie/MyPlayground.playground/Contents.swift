import UIKit

class Refeicao{
    var nome:String;
    var felicidade:String;
    var itens: Array<Item> = [];
    
    init(nome:String,felicidade:String) {
        self.nome = nome;
        self.felicidade = felicidade;
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



class Item {
    var nome: String;
    var calorias: Double;
    
    init(nome:String,calorias:Double){
        self.nome = nome;
        self.calorias = calorias;
    }
}

let arroz = Item(nome:"Arroz",calorias: 51.8);
let feijao = Item(nome:"Feijao",calorias: 90.0);
let batata = Item(nome:"Batata",calorias: 35.8);
let contraFile = Item(nome:"Contra File",calorias: 125.5);

let refeicao = Refeicao(nome:"Almoço",felicidade: "5");

//refeicao.itens.append(contentsOf: [arroz,feijao,batata,contraFile])


print(refeicao.getTotalCalorias())
