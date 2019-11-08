//
//  HomeViewController.swift
//  2GO
//
//  Created by Tatiana Rico on 15/10/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchUiSearch: UISearchBar!
    
    @IBOutlet weak var eventoImagem: UIImageView!
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var testeImage: String = "show metalica"
    
    let event  = EventProvider()
    
    private var categoria: Categoria?
    
    //event.alamofireEvent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        self.category()
    }
    
    func category(){
        event.requestCategory { (object) in
            self.categoria = object
            self.homeCollectionView.reloadData()
         
        }
        
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoria?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellXib", for: indexPath) as? HomeCollectionViewCell
        
        cell?.titleCategoryLabel.text = categoria?.categories[indexPath.row].name
        
        return cell ?? HomeCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if #available(iOS 13.0, *) {
            if let vc = self.storyboard?.instantiateViewController(identifier: "TelaDoEventoViewController") {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
    
}
