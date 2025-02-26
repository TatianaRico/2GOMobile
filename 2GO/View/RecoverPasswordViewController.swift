//
//  RecoverPasswordViewController.swift
//  2GO
//
//  Created by Mônica Marques on 14/11/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class RecoverPasswordViewController: UIViewController {
    
    let recoverPasswordController = RecoverPasswordController()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var btnEnviar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnEnviar.layer.cornerRadius = btnEnviar.frame.size.height/2
        self.btnEnviar.clipsToBounds = true
        
    }
    
    @IBAction func voltarButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enviarButton(_ sender: UIButton) {
        if let email = emailTextField.text {
            if email.isEmpty {
                let userMessage: String = "Insira seu email"
                displayMessage(userMessage: userMessage)
                return
            } else {
                self.sendPasswordReset()
            }
        }
    }
    
    func sendPasswordReset () {
        
        recoverPasswordController.sendPasswordReset(email: emailTextField.text ?? "") { (sucesso,mensagem)  in
            if sucesso {
                let userMessage: String = "Enviamos um email para \(self.emailTextField.text ?? "")"
                self.displayMessage(userMessage: userMessage)
                
            } else {
                self.displayMessage(userMessage: mensagem)
                
            }
        }
    }
    
    func displayMessage(userMessage: String) {
        
        let alerta = UIAlertController(title: "Alerta", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alerta.addAction(okAction)
        self.present(alerta, animated: true, completion: nil)
    }
}

