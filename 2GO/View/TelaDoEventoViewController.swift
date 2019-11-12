//
//  TelaDoEventoViewController.swift
//  2GO
//
//  Created by Esther Souza on 15/09/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit

class TelaDoEventoViewController: UIViewController {

    @IBOutlet weak var imagemLogo: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
   
    let event  = EventProvider()
    var categoria: Category?
    var eventoLista: Evento?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "TelaDoEventoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellTelaDoEvento")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        pegarEvento()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Evento"
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func pegarEvento() {
        event.alamofireEvent(id: categoria?.id ?? "") { (eventoLista, successo) in
             if successo {
                 self.eventoLista = eventoLista
                 self.collectionView.reloadData()
             } else {
                 self.mostrarTelaDeError()
             }
         }
    }
    
    func mostrarTelaDeError() {
        let alerta = UIAlertController(title: "Alerta", message: "Houve um erro inesperado", preferredStyle: .alert)
        let botaoAlerta = UIAlertAction(title: "OK", style: .default) { (alert) in
            self.navigationController?.popViewController(animated: true)
        }
        alerta.addAction(botaoAlerta)
        self.present(alerta, animated: true, completion: nil)
    }
}

extension TelaDoEventoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.eventoLista?.events.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cellTelaDoEvento", for: indexPath) as? TelaDoEventoCollectionViewCell
        cell?.setup(event: self.eventoLista?.events[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetalheDoEventoViewController") as? DetalheDoEventoViewController{
            vc.evento = self.eventoLista?.events[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
