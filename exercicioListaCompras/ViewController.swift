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
    @IBOutlet weak var actionButtonSaveManagement: UIButton!
    @IBOutlet weak var actionButtonClearManagement: UIButton!
    @IBOutlet weak var actionButtonDeleteManagement: UIButton!
    @IBOutlet weak var labelList: UILabel!
    
    var tempItem = ManageItem(arrayProducts: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldProduto.delegate = self
        textFieldQuantidade.delegate = self
        textFieldQuantidade.isEnabled = false
        actionButtonSaveManagement.isEnabled = false
        actionButtonClearManagement.isEnabled = false
        actionButtonDeleteManagement.isHidden = true
        textFieldProduto.becomeFirstResponder()
    }
    
    @IBAction func actionButtonSave(_ sender: UIButton) {
        if actionButtonSaveManagement.currentTitle == "Alterar" {
            if let product = textFieldProduto.text, let quantity = Int(textFieldQuantidade.text!) ?? 0 {
                tempItem.setQuantity(product: product, quantity: quantity)
                actionButtonSaveManagement.setTitle("Salvar", for: .normal)
                clearFields()
                updateLabel()
            }
        } else {
            if let product = textFieldProduto.text, let quantity = Int(textFieldQuantidade.text!) ?? 0 {
                tempItem.setAddItem(product: product, quantity: quantity)
                clearFields()
                updateLabel()
            }
        }
    }
    
    
    @IBAction func actionButtoClear(_ sender: UIButton) {
        clearFields()
        textFieldProduto.becomeFirstResponder()
        actionButtonDeleteManagement.isHidden = true
        actionButtonClearManagement.isEnabled = false
        updateLabel()
    }
    

    
    @IBAction func actionButtoDelete(_ sender: UIButton) {
        tempItem.deleteItem(product: textFieldProduto.text!)
        clearFields()
        updateLabel()
    }

    
    func updateLabel() {
        var updateList: String = ""
        for item in tempItem.arrayProdutcs {
            updateList = "\(updateList)\(item.product) - \(item.quantity)\n"
        }
        labelList.text = updateList
    }
    
    func clearFields() {
        textFieldProduto.text = ""
        textFieldQuantidade.text = ""
        actionButtonSaveManagement.setTitle("Salvar", for: .normal)
        actionButtonDeleteManagement.isHidden = true
        actionButtonClearManagement.isEnabled = false
        actionButtonSaveManagement.isEnabled = false
        textFieldQuantidade.isEnabled = false
        textFieldProduto.becomeFirstResponder()
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldProduto {
            if textField.text == nil || textField.text!.isEmpty  {
                print("ALERT")
                textFieldProduto.becomeFirstResponder()
            } else {
                actionButtonClearManagement.isEnabled = true
                textFieldQuantidade.isEnabled = true
                textFieldQuantidade.becomeFirstResponder()
                if tempItem.itemExist(product: textFieldProduto.text!) {
                    textFieldQuantidade.text = String(tempItem.getQuantity(product: textFieldProduto.text!))
                    actionButtonSaveManagement.setTitle("Alterar", for: .normal)
                    actionButtonSaveManagement.isEnabled = true
                    actionButtonDeleteManagement.isHidden = false
                } else {
                    textFieldQuantidade.isEnabled = true
                    actionButtonSaveManagement.isEnabled = true
                }
            }
        }
        return true
    }
}

