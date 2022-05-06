//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Lúcio Silveira on 25/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameTextField:UITextField?
    
    @IBOutlet var happynesField:UITextField?
    
    @IBAction func addFood(_ sender: Any) {
        
        guard let nome = nameTextField?.text else{
            return;
        };
        guard let felicidadeText = happynesField?.text, let felicidade = Int(felicidadeText) else{
            print("Erro ao pegar felicidade")
            return;
        };
        
       
        
        let refeicao = Refeicao(nome:nome,felicidade: felicidade)
        
        print(refeicao.toString());
    }
    
  


}

