//
//  DetalheSpViewController.swift
//  2GO
//
//  Created by Tatiana Rico on 18/11/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit
import SDWebImage

class DetalheSpViewController: UIViewController {
    
    @IBOutlet weak var wazeBotao: UIButton!
    @IBOutlet weak var localImagem: UIImageView!
    @IBOutlet weak var nomeLocalLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    @IBOutlet weak var telefoneLabel: UILabel!
    @IBOutlet weak var horariofuncLabel: UILabel!
    @IBOutlet weak var avaliacaoLabel: UILabel!
    
    var localSp: Business?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.setGradientToView(colorOne: UIColor.systemBlue, colorTwo: UIColor.systemPurple)
        self.wazeBotao.layer.cornerRadius = wazeBotao.frame.size.height/2
              self.wazeBotao.clipsToBounds = false
        let rua: String? =  localSp?.location.displayAddress[0]
        let cidade: String? = localSp?.location.displayAddress[1]
        
        self.localImagem?.sd_setImage(with: URL(string: localSp?.imageURL ?? ""), placeholderImage: UIImage(named: "placeholderimage"), options: .handleCookies, progress: .none, completed: nil)
        self.nomeLocalLabel.text = localSp?.name
        self.enderecoLabel.text = "\(rua ?? ""), \(cidade ?? "")"
        self.telefoneLabel.text = localSp?.displayPhone
        self.horariofuncLabel.text = self.checkIsOpen(value: localSp?.isClosed ?? false)
        self.avaliacaoLabel.text = String(localSp?.rating ?? 0)
    }
    
    func checkIsOpen(value: Bool) -> String {
        
        if value  {
            return "Aberto"
        }
        
        return "Fechado"
    }
    
    @IBAction func tracarRotaButton(_ sender: UIButton) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetalheRotaMapViewController") as? DetalheRotaMapViewController {
            vc.localSp = self.localSp
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func voltarButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}



