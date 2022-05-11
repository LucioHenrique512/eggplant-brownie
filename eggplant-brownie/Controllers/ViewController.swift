//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Lúcio Silveira on 25/04/22.
//

import UIKit

protocol AddRefeicaoDelegate {
    func add(_ refeicao:Refeicao)
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,AddItemDelegeate {
   

    
    // MARK: - Atributes
    
    var delegate: AddRefeicaoDelegate?;
    
    var itens:[Item] = [];
    
    var selectedItens:[Item] = [];
   
    // MARK: - IBOutlets
    
    @IBOutlet var nameTextField:UITextField?
    
    @IBOutlet var happynesField:UITextField?
    
    @IBOutlet weak var itensTableView: UITableView?
    
    
    // MARK: - ViewLifeSycle
    
    override func viewDidLoad() {
        let buttonAddItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addItemNavigate));
        navigationItem.rightBarButtonItem = buttonAddItem;
    }
    
    @objc func addItemNavigate(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self);
        navigationController?.pushViewController(adicionarItensViewController, animated: true);
    }
    
    func add(_ item:Item){
        itens.append(item);
        itensTableView?.reloadData();
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = itens[indexPath.row].nome;
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return;}
        
        if cell.accessoryType == .none {
            selectedItens.append(itens[indexPath.row]);
            cell.accessoryType = .checkmark;
        }else {
            let item = itens[indexPath.row]
            guard let position = selectedItens.firstIndex(of: item) else {return;}
            selectedItens.remove(at: position);
            cell.accessoryType = .none;
        }
       
        
        
    }
    
    // MARK: - IBActions
    
    @IBAction func addFood(_ sender: Any) {
        
        guard let name = nameTextField?.text else{
            return;
        };
        guard let felicidadeText = happynesField?.text, let felicidade = Int(felicidadeText) else{
            print("Erro ao pegar felicidade")
            return;
        };
        
        
       
        
        let refeicao = Refeicao(nome:name,felicidade: felicidade,itens:selectedItens);
        
        
        delegate?.add(refeicao);
        navigationController?.popViewController(animated: true);
                
    }
    
    
   


}

