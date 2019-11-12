//
//  ViewController.swift
//  2gologin
//
//  Created by Tatiana Rico on 15/09/19.
//  Copyright © 2019 Tatiana Rico. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: BaseViewController{
    @IBOutlet weak var twoGoImage: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func acessarButton(_ sender: UIButton){
        if loginTextField.text == "" || senhaTextField.text == "" {
            mensagemDeErro(mensagem: "Login ou Senha Incorreto")
            
        }else {
            self.showLoading()
            self.verificarLogin()
        }
        
    }
    
    func verificarLogin() {
        
        guard let email = self.loginTextField.text, let senha = self.senhaTextField.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: senha) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
             strongSelf.hiddenLoading()
            if error == nil {
                let userDefaults = UserDefaults.standard
                userDefaults.set(strongSelf.loginTextField.text, forKey: "email")
                userDefaults.synchronize()
                strongSelf.vaiPraHome()
              
            } else {
                strongSelf.mensagemDeErro(mensagem: "Email ou Senha Incorreto")
            }
        }
        
        
//                let ref: DatabaseReference! = Database.database().reference()
//                var achou = false
//
//                ref.child("usuarios").observe(.value, with: { (snapshot) in
//                  let postDict = snapshot.value as? [String : AnyObject] ?? [:]
//
//                    for userData in postDict.values {
//                        if let userEmail = userData["email"] as? String, userEmail == email,
//                           let userSenha = userData["senha"] as? String, userSenha == senha{
//                            achou = true
//                        }
//                    }
        
                  
                    
//                    if achou {
//                        let userDefaults = UserDefaults.standard
//                        userDefaults.set(self.loginTextField.text, forKey: "email")
//                        userDefaults.synchronize()
//                        self.vaiPraHome()
//                    }else {
//                        self.mensagemDeErro(mensagem: "Login ou Senha Incorreto")
//                    }
//                })
        
    }
    
    func mensagemDeErro(mensagem:String) {
        let alerta = UIAlertController(title: "Alerta", message: mensagem, preferredStyle: .alert)
        let botaoAlerta = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(botaoAlerta)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func vaiPraHome(){
        
        if let proximaTela = self.storyboard?.instantiateViewController(withIdentifier: "TabViewController")  {
            proximaTela.modalPresentationStyle = .fullScreen
            self.present(proximaTela, animated: true, completion: nil)
        }
    }
    
    func vaiParaTelaDeCadastro(){
        if let telaCadastro = self.storyboard?.instantiateViewController(withIdentifier: "CadastroViewController") as? CadastroViewController {
            telaCadastro.modalPresentationStyle = .fullScreen
            self.present(telaCadastro, animated: true) {
            }
        }
    }
    
    @IBAction func acessarFacebookButton(_ sender: UIButton) {
    }
    
    @IBAction func semLoginButton(_ sender: UIButton) {
        self.vaiParaTelaDeCadastro()
    }
    
}


