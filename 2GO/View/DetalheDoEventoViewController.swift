//
//  DetalheDoEventoViewController.swift
//  2GO
//
//  Created by Tatiana Rico on 09/11/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit
import SDWebImage

class DetalheDoEventoViewController: UIViewController {
    
    @IBOutlet weak var nomeEventoLabel: UILabel!
    
    @IBOutlet weak var descricaoEventoTextView: UITextView!
    
    @IBOutlet weak var fotoEvento: UIImageView!
    
    var evento: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descricaoEventoTextView.text = evento?.eventDescription?.text
        self.nomeEventoLabel.text = evento?.name?.text
        self.fotoEvento.sd_setImage(with: URL(string: evento?.logo?.original?.url ?? ""), completed: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Detalhe"
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

