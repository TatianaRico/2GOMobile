//
//  CadastroViewController.swift
//  2GO
//
//  Created by Monica Marques on 16/09/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CadastroViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var perfilImage: UIImageView!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var nascimentoTextField: UITextField!
    @IBOutlet weak var generoTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmacaoSenhaTextField: UITextField!
    
    var ref: DatabaseReference! = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let toqueImagemPerfil = UITapGestureRecognizer(target: self, action: #selector(self.fotoButton))
        toqueImagemPerfil.numberOfTouchesRequired = 1
        self.perfilImage.isUserInteractionEnabled = true
        self.perfilImage.addGestureRecognizer(toqueImagemPerfil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        self.nomeTextField.delegate = self
        self.nascimentoTextField.delegate = self
        self.generoTextField.delegate = self
        self.cpfTextField.delegate = self
        self.emailTextField.delegate = self
        self.senhaTextField.delegate = self
        self.confirmacaoSenhaTextField.delegate = self
    }
    
    @objc func fotoButton(_ sender: UIButton) {
            
        let alert = UIAlertController(title: "Alerta", message: "Selecione o tipo desejado", preferredStyle: .actionSheet)
            
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            self.getImage(fromSourceType: .camera)
        }))
            
        alert.addAction(UIAlertAction(title: "Album", style: .default, handler: { (action) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
            
            self.present(alert, animated: true, completion: nil)
        }
                
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
            
        
        @IBAction func cadastrarButton(_ sender: UIButton) {
            
            if nomeTextField.text == "" || nascimentoTextField.text == "" || generoTextField.text == "" || cpfTextField.text == "" || emailTextField.text == "" || senhaTextField.text == "" || confirmacaoSenhaTextField.text == "" {
                self.mensagemDeErro(mensagem: "Verifique suas informações")
            }else {
                self.cadastrarUsuario()
            }
        }
    
    func cadastrarUsuario() {
        
        self.ref.child("usuarios").childByAutoId().setValue(["nome": self.nomeTextField.text,
                                             "nascimento": self.nascimentoTextField.text,
                                             "cpf": self.cpfTextField.text,
                                             "genero": self.generoTextField.text,
                                             "senha": self.senhaTextField.text,
                                             "email": self.emailTextField.text])
        { (error:Error?, ref:DatabaseReference) in
            if let _ = error {
                self.mensagemDeErro(mensagem: "houve um erro ao cadastrar no nosso banco.")
            } else {
                print("cadastrou!")
                
                let userDefaults = UserDefaults.standard
                userDefaults.set(self.emailTextField.text, forKey: "email")
                userDefaults.synchronize()
                
                self.vaiParaHome()
            }
        }
    }
        
        func mensagemDeErro(mensagem:String) {
            let alerta = UIAlertController(title: "Alerta", message: mensagem, preferredStyle: .alert)
            let botaoAlerta = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alerta.addAction(botaoAlerta)
            self.present(alerta, animated: true, completion: nil)
        }
        
        func vaiParaHome(){
            if let proximaTela = self.storyboard?.instantiateViewController(withIdentifier: "TabViewController") {
                proximaTela.modalPresentationStyle = .fullScreen
                self.present(proximaTela, animated: true, completion: nil)
            }
        }
    
        @objc func keyboardWillShow(notification: NSNotification) {
            let userInfo = (notification as NSNotification).userInfo!
            let keyboardSize = (userInfo [UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
            
            self.scrollView.contentInset.bottom = (keyboardSize.height + 500 )
            self.view.layoutIfNeeded()
        }

        @objc func keyboardWillHide(notification: NSNotification) {
            self.scrollView.contentInset = .zero
        }
    
    }

extension CadastroViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         
         let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
         
         self.perfilImage.image = image
        picker.dismiss(animated: true, completion: nil)
        
     }
}

extension CadastroViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField .isEqual(self.nomeTextField) {
            self.nascimentoTextField.becomeFirstResponder()
        }else if textField .isEqual(self.nascimentoTextField) {
            self.generoTextField.becomeFirstResponder()
        }else if textField .isEqual(self.generoTextField) {
            self.cpfTextField.becomeFirstResponder()
        }else if textField .isEqual(self.cpfTextField) {
            self.emailTextField.becomeFirstResponder()
        }else if textField .isEqual(self.emailTextField) {
            self.senhaTextField.becomeFirstResponder()
        }else if textField .isEqual(self.senhaTextField) {
            self.confirmacaoSenhaTextField.becomeFirstResponder()
        }else if textField .isEqual(self.confirmacaoSenhaTextField) {
            self.view.endEditing(true)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.scrollRectToVisible(CGRect(x: 0, y: textField.frame.origin.y, width: 0, height: 0), animated: true)
    }
    
}
