//
//  RecoverPasswordController.swift
//  2GO
//
//  Created by Mônica Marques on 27/11/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class RecoverPasswordController {
    
    let userMessage = "insira seu email"
    
    func sendPasswordReset(email: String, completion: @escaping (Bool,String) -> Void) {
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            if (error == nil) {
                completion(true,"")
            } else {
                completion(false, error?.localizedDescription ?? "")
            }
            
        }
    }
}

