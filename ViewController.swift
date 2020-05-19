//
//  ViewController.swift
//  SuperSenha
//
//  Created by William Tomaz on 07/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCaracters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCaracters: UISwitch!
    @IBOutlet weak var btGerarSenha: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func statusButton(_ sender: UISwitch) {
        StatusButton()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let passwordsViewController = segue.destination as! PasswordsViewController //intanciando a classe de destino da segue
        if let numberOfPasswords = Int(tfTotalPasswords.text!){
            passwordsViewController.numberOfPasswords = numberOfPasswords //se tiver dados recebidos, a variavel recebe o novo valor de numberOfPasswords
        }
        if let numberOfCaracteres = Int(tfNumberOfCaracters.text!){
            passwordsViewController.numberOfCaracters = numberOfCaracteres //se tiver dados recebidos, a variavel recebe o novo valor de numberOfCaracteres
        }
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useSpecialCaracters = swSpecialCaracters.isOn
        view.endEditing(true) //perde o foco dos elementos e some o teclado
    }
    func StatusButton(){
        if !swLetters.isOn && !swCapitalLetters.isOn && !swNumbers.isOn && !swSpecialCaracters.isOn{
        btGerarSenha.isEnabled = false
        btGerarSenha.backgroundColor = .gray
        } else {
            btGerarSenha.isEnabled = true
            
        }
    }
}

