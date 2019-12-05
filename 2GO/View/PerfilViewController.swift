//
//  PerfilViewController.swift
//  2GO
//
//  Created by Mônica Marques on 20/10/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PerfilViewController: UIViewController {


    @IBOutlet weak var perfilImage: UIImageView!
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var nascimentoTextField: UITextField!
    @IBOutlet weak var generoTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getUserData()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func fecharButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func voltarButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func alteracaoButton(_ sender: UIButton) {
    }
    
    func getUserData() {
        
        let userDefaults = UserDefaults.standard
        
        guard let email = userDefaults.string(forKey: "email") else {
            return
        }
        
        
        if let imageData = userDefaults.data(forKey: "imagePerfil"),
           let image = NSKeyedUnarchiver.unarchiveObject(with: imageData) as? UIImage {
            
            self.perfilImage.image = image
        }
        
        let ref: DatabaseReference! = Database.database().reference()
        
        ref.child("usuarios").observe(.value, with: { (snapshot) in
          let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            for userData in postDict.values {
                if let userEmail = userData["email"] as? String, userEmail == email {
                    self.fillUserData(userData)
                    break
                }
            }
        })
    }
    
    func fillUserData(_ userData: Any) {
        
        guard let userInfo = userData as? NSMutableDictionary else {return}
        self.nomeTextField.text = userInfo["nome"] as? String ?? ""
        self.nascimentoTextField.text = userInfo["nascimento"] as? String ?? ""
        self.cpfTextField.text = userInfo["cpf"] as? String ?? ""
        self.generoTextField.text = userInfo["genero"] as? String ?? ""
        self.emailTextField.text = userInfo["email"] as? String ?? ""
        print(userInfo)
    }
    
}
