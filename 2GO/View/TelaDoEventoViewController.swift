//
//  TelaDoEventoViewController.swift
//  2GO
//
//  Created by Esther Souza on 15/09/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit

class TelaDoEventoViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
   
    let event  = EventProvider()
    var categoria: Category?
    var eventoLista: Evento?
    let eventLocation = LocationProvider()
    
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
        eventLocation.alamofireLocation { (location, sucesso) in
            if sucesso {
                print(location)
            } else {
                print("Deu errado")
            }
        }
//        event.alamofireEvent(id: categoria?.id ?? "") { (eventoLista, successo) in
//             if successo {
//                 self.eventoLista = eventoLista
//                 self.collectionView.reloadData()
//             } else {
//                 self.mostrarTelaDeError()
//             }
//         }
    }
    
    func mostrarTelaDeError() {
        let alerta = UIAlertController(title: "Alerta", message: "Houve um erro inesperado", preferredStyle: .alert)
        let botaoAlerta = UIAlertAction(title: "OK", style: .default) { (alert) in
            self.navigationController?.popViewController(animated: true)
        }
        alerta.addAction(botaoAlerta)
        self.present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func verMapaButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "MapViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let vc: MapViewController = segue.destination as? MapViewController else {
            return
            
        }
        
        // vc.

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
