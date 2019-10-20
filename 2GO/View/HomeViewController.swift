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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        self.homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellXib")
    }
    

    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellXib", for: indexPath) as? HomeCollectionViewCell
        
        cell?.imageXibCollection.image = UIImage(named: testeImage)
        
        return cell ?? HomeCollectionViewCell()
    }
    
    
}
