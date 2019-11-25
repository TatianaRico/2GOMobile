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
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
            }
           

            Auth.auth().sendPasswordReset(withEmail: email) { error in
                   if (error != nil) {
                       let userMessage: String = error!.localizedDescription
                       self.displayMessage(userMessage: userMessage)
                   } else {
                       let userMessage: String = "Enviamos um email para \(email)"
                       self.displayMessage(userMessage: userMessage)
                   }
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

