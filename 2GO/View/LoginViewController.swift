//
//  ViewController.swift
//  2gologin
//
//  Created by Tatiana Rico on 15/09/19.
//  Copyright © 2019 Tatiana Rico. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var twoGoImage: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

    @IBAction func acessarButton(_ sender: UIButton) {
        if loginTextField.text == "" || senhaTextField.text == "" {
            mensagemDeErro(mensagem: "Login ou Senha Incorreto")
            
        }else {
            
            vaiPraTelaDeEvento()
        }
    }
    
    func mensagemDeErro(mensagem:String) {
        let alerta = UIAlertController(title: "Alerta", message: mensagem, preferredStyle: .alert)
        let botaoAlerta = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(botaoAlerta)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func vaiPraTelaDeEvento(){
        if let proximaTela = self.storyboard?.instantiateViewController(withIdentifier: ""){
            //withidentifier : colocar o indentificardor da outra view controller evento
            self.present(proximaTela, animated: true, completion: nil)
            //usar esse metodo para ir para proxima tela
        }
    }
    
    func vaiParaTelaDeCadastro(){
        if let telaCadastro = self.storyboard?.instantiateViewController(withIdentifier: ""){
            // colocar o indentificador da tela cadastro
          self.present(telaCadastro, animated: true, completion: nil)
        }
    }
    
    @IBAction func acessarFacebookButton(_ sender: UIButton) {
    }
    
    @IBAction func semLoginButton(_ sender: UIButton) {
        if loginTextField.text == "" || senhaTextField.text == ""{
            print("clicou")
        }else{
            vaiParaTelaDeCadastro()
        }
    
    }
    
}


