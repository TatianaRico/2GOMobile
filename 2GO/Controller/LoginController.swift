//
//  LoginController.swift
//  2GO
//
//  Created by Tatiana Rico on 25/11/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginController {
    
    var mensagemErrorEmailOuSenhaIncorreto = "Email ou Senha Incorreto"
    
    
    func logar(email: String, senha: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: senha) { authResult, error in
            
            if error == nil {
                let userDefaults = UserDefaults.standard
                userDefaults.set(email, forKey: "email")
                userDefaults.synchronize()
                
                completion(true)
                
            } else {
                completion(false)
                
            }
        }
    }
    
    
    func textoVazio(texto: String) -> Bool {
        return texto.isEmpty 
        
    }
    
}
