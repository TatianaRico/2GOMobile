//
//  TelaDoEventoViewController.swift
//  2GO
//
//  Created by Esther Souza on 15/09/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit

class TelaDoEventoViewController: UIViewController {

    
    @IBOutlet weak var nomeEventoLabel: UILabel!
   
    @IBOutlet weak var descricaoEventoTextView: UITextView!
    
    @IBOutlet weak var fotoEvento: UIImageView!

    let event  = EventProvider()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descricaoEventoTextView.text = "Viviane de Queiroz Pereira, mais conhecida pelo seu nome artístico Pocah[1] (Queimados, 17 de outubro de 1994), é uma cantora e compositora brasileira. Iniciou sua carreira musical no ano de 2010 e ficou conhecida por todo o país pela canção Mulher do Poder."
        self.nomeEventoLabel.text = "Pocah"
        self.fotoEvento.image = UIImage (named: "fotoPocah")
        
        
    }

}
