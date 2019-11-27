//
//  CadastroController.swift
//  2GO
//
//  Created by Mônica Marques on 26/11/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class CadastroController {
    
    
    private let genero = ["Feminino", "Masculino"]
    private var selectGenero: String?
    
    let mensagemErrorCadastrar = "Verifique suas informações"
    let mensagemErrorCriarUsuario = "Houve um erro ao cadastrar no nosso banco."
    
    func setSelectGenero(genero: String) {
        selectGenero = genero
    }
    
    func getSelectGenero() -> String {
        return selectGenero ?? ""
    }
    
    func generoCount() -> Int {
        return genero.count
    }
    
    func generoRow(row: Int) -> String {
        return genero[row]
    }
    
    func criarUsuario(email: String, senha: String, completion: @escaping (Bool) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: senha) { authResult, error in
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func cadastrarUsuario(email: String, nascimento: String, cpf: String, genero: String, senha: String, nome: String, completion: @escaping (Bool) -> Void) {
        
        let ref: DatabaseReference! = Database.database().reference()

        ref.child("usuarios").childByAutoId().setValue(["nome": nome,
                                                             "nascimento": nascimento,
                                                             "cpf": cpf,
                                                             "genero": genero,
                                                             "senha": senha,
                                                             "email": email])
        { (error:Error?, ref:DatabaseReference) in
            if let _ = error {
                completion(false)
            } else {
                print("cadastrou!")
                
                let userDefaults = UserDefaults.standard
                userDefaults.set(email, forKey: "email")
                userDefaults.synchronize()
                
                completion(true)
            
            }
        }
    }
}
