//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by William Tomaz on 07/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import Foundation

//Classe MODEL do MVC

class PasswordGenerator{
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    
    //Apenas essa classe deve ter acesso a essas constantes.
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-=+˜`|]}[{':;?/><.,"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        
        var numchars = min(numberOfCharacters, 16) //compara entre a variavel numberofCharacters e o número 16, o que for menor é recolhido
        numchars = max(numberOfCharacters, 1) //compara entre a variavel numberofCharacters e o número 1, o que for maior é recolhido
        
        self.numberOfCharacters = numchars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String] { //vai ser passado no Passwordcontroller 
        
        passwords.removeAll() //limpa o array
        var universe: String = ""
        
        if useLetters {
            universe += letters // se for true, o array ira receber ele mesmo + letras
        }
        
        if useNumbers {
            universe += numbers //se for true, o array ira receber ele mesmo + numeros
        }
        
        if useSpecialCharacters {
            universe += specialCharacters //se for true, o array ira receber ele mesmo + caracteres especiais
        }
        
        if useCapitalLetters {
            universe += letters.uppercased() //se for true, o array ira receber ele mesmo + letras maiusculas
        }
        
        let universeArray = Array(universe) //Criado um array contendo todas os caracteres escolhidos
        
        while passwords.count < total{ //Enquanto a quantidade do array, for menor que a que o usuario digitar vai ser percorrido o array
            var password = ""
            for _ in 1...numberOfCharacters{ //percorre de 1 ate o numeros de caracteres
                let index = Int(arc4random_uniform(UInt32(universeArray.count))) //pega o numero do indice do "universo"
                password += String(universeArray[index])// é recebido os caracteres aleatorios gerados no loop
            }
            passwords.append(password) //adiciona no array de senhas
        }
        
        return passwords
    }
    
}
