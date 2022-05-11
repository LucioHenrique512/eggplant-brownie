//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Lúcio Silveira on 10/05/22.
//

import UIKit

protocol AddItemDelegeate {
    func add(_ item:Item);
}

class AdicionarItensViewController: UIViewController {
    
    //MARK: - Atributes
    
    var delegate:AddItemDelegeate?;
    
    init(delegate: AddItemDelegeate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil);
        self.delegate = delegate;
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField?
    
    @IBOutlet weak var caloriasTextField: UITextField?
    

    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - IBAction

    @IBAction func addItem(_ sender: Any) {
        
        guard let nome = nomeTextField?.text else {return;};
        guard let caloriasText = caloriasTextField?.text,let calorias = Double(caloriasText)  else {
            print("Erro ao pegar calorias")
            return;
            
        };
        
        let newItem = Item(nome: nome, calorias: calorias)
        
        delegate?.add(newItem);
        
        navigationController?.popViewController(animated: true);
    }
    

}
