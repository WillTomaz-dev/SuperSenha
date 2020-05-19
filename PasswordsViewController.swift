//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by William Tomaz on 07/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCaracters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCaracters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            title = "Total de senhas:\(numberOfPasswords)"
            passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCaracters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCaracters) //iniciando a classe instanciada com variaveis da classe atual
            generatePasswords()
        
        }
    
    func generatePasswords(){
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0)) //se o usuario estive scrollado ao gerar nvamente, voltara ao inicio da textview
        tvPasswords.text = " "
        let passwords = passwordGenerator.generate(total: numberOfPasswords) //Passasndo a quantidade de caracteres desejado// função da model PAsswordGenerator
        for password in passwords {
            tvPasswords.text.append(password + "\n \n") //está percorrendo o array e inserindo na textView
        }
    }
    @IBAction func btGenerate(_ sender: UIButton) {
        generatePasswords()
    }
}
