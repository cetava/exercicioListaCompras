//
//  ViewController.swift
//  exercicioListaCompras
//
//  Created by Cesar A. Tavares on 9/16/20.
//  Copyright © 2020 Cesar A. Tavares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldProduto: UITextField!
    @IBOutlet weak var textFieldQuantidade: UITextField!
    @IBOutlet var labelLista: UILabel!
    var arrayProdutos = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldProduto.delegate = self
        textFieldQuantidade.delegate = self
        atualizarLabel()
    }

    @IBAction func actionButtonSalvar(_ sender: Any) {
    }
    
    @IBAction func actionButtonLimpar(_ sender: Any) {
        limpaCampos()
    }
    
    @IBAction func actionButtonExcluir(_ sender: Any) {
    }
    
    func produtoExiste(item: Item) -> Bool{
        for item in arrayProdutos {
            if item.produto.lowercased() == textFieldProduto.text!.lowercased() {
                textFieldQuantidade.text = String(item.quantidade)
                // atualizar o nome do botão para Editar
                return true
            }
        }
        return false
    }
    
    func criarProduto(itemProduto: Item){
        if !produtoExiste(item: itemProduto) {
            if let produto = textFieldQuantidade.text, let quantidade = textFieldQuantidade.text {
                let itemNovo = Item(produto: produto, quantidade: Int(quantidade) ?? 0)
                arrayProdutos.append(itemNovo)
            }
        }
    }
    
    func excuirProduto(item: Item){
        
        // verificar o for
        var count = 0
        for item in arrayProdutos {
            if item.produto.lowercased() == textFieldProduto.text!.lowercased() {
                arrayProdutos.remove(at: count)
            } else {
                count+=1
            }
        }
    }
    
    func alterarQuantidade(itemProduto: Item){

        for item in arrayProdutos {
            if item.produto.lowercased() == itemProduto.produto.lowercased() {
                item.quantidade = Int(textFieldQuantidade.text!) ?? 0
            }
        }
    }
    
    func atualizarLabel() {
        var contuedoLabel: String = ""
        for item in arrayProdutos{
            contuedoLabel+=item.produto + "\n"
        }
        labelLista.text = contuedoLabel
    }
    
    func limpaCampos() {
        textFieldQuantidade.text = ""
        textFieldProduto.text = ""
    }
    
}

extension ViewController: UITextFieldDelegate {
    
}


