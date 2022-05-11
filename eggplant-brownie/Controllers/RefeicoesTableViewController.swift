//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Lúcio Silveira on 09/05/22.
//

import UIKit



class RefeicoesTableViewController:UITableViewController,AddRefeicaoDelegate{
    
    var refeicoes:Array<Refeicao> = [];
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil);
        cell.textLabel?.text = refeicoes[indexPath.row].nome;
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.showDetails));
        
        cell.addGestureRecognizer(longPress);
        
        return cell;
    }
    
    @objc func showDetails(_ gesture:UILongPressGestureRecognizer){
        if gesture.state == .began {
            let cell = gesture.view as! UITableViewCell;
            guard let indexPath = tableView.indexPath(for: cell) else {
                return;
            }
            
            let selectedItem = refeicoes[indexPath.row]
            
            let alert = UIAlertController(title: selectedItem.nome, message: "Felicidade: \(selectedItem.felicidade)\n Calorias:\(selectedItem.getTotalCalorias())", preferredStyle: .alert);
            
            let calcellButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil);
            
            alert.addAction(calcellButton);

            present(alert, animated:true);

          
            
            
        }
        
    }
    
    func add(_ refeicao:Refeicao){
        refeicoes.append(refeicao);
        tableView.reloadData();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addFood"{
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self;
            }
        }
        
    }
    
}
