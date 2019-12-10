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

class LoginViewController: BaseViewController {
    
    @IBOutlet var myView: UIView!
    @IBOutlet weak var twoGoImage: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var btnEntrar: UIButton!
    @IBOutlet weak var btnEsqueciSenha: UIButton!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    let loginController = LoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginTextField.text = "tatianarico1702@gmail.com"
        self.senhaTextField.text = "123456"
        self.loginTextField.layer.cornerRadius = loginTextField.frame.size.height/2
        self.loginTextField.layer.masksToBounds = true
        self.senhaTextField.layer.cornerRadius = senhaTextField.frame.size.height/2
        self.senhaTextField.layer.masksToBounds = true
        self.btnEntrar.layer.cornerRadius = btnEntrar.frame.size.height/2
        self.btnEntrar.clipsToBounds = true
        self.btnCadastrar.layer.cornerRadius = btnCadastrar.frame.size.height/2
        self.btnCadastrar.clipsToBounds = true
        self.btnEsqueciSenha.layer.cornerRadius = btnEsqueciSenha.frame.size.height/2
        self.btnEsqueciSenha.clipsToBounds = false

    
    }
    
    @IBAction func esqueciSenhaButton(_ sender: UIButton) {
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
        
        loginController.logar(email: email, senha: senha) { [weak self] (sucesso) in
            guard let strongSelf = self else { return }
            strongSelf.hiddenLoading()
            if sucesso {
                strongSelf.vaiPraHome()
            } else {
                strongSelf.mensagemDeErro(mensagem: strongSelf.loginController.mensagemErrorEmailOuSenhaIncorreto)
            }
        }
        
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
    
    
    @IBAction func semLoginButton(_ sender: UIButton) {
        self.vaiParaTelaDeCadastro()
    }
}



