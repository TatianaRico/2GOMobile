//
//  CadastroViewController.swift
//  2GO
//
//  Created by Monica Marques on 16/09/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var nascimentoTextField: UITextField!
    @IBOutlet weak var generoTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmacaoSenhaTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cadastrarButton(_ sender: UIButton) {
        
        if nomeTextField.text == "" || nascimentoTextField.text == "" || generoTextField.text == "" || cpfTextField.text == "" || emailTextField.text == "" || senhaTextField.text == "" || confirmacaoSenhaTextField.text == "" {
            mensagemDeErro(mensagem: "Verifique suas informações")
        }else {
            vaiParaTelaDeEvento()
        }
    }
    
    func mensagemDeErro(mensagem:String) {
        let alerta = UIAlertController(title: "Alerta", message: mensagem, preferredStyle: .alert)
        let botaoAlerta = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(botaoAlerta)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func vaiParaTelaDeEvento(){
        if let proximaTela = self.storyboard?.instantiateViewController(withIdentifier: ""){
            //withidentifier : colocar o indentificardor da outra view controller evento
            self.present(proximaTela, animated: true, completion: nil)
            //usar esse metodo para ir para proxima tela
        }
    }
    
}
