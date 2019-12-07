//
//  HomeViewController.swift
//  2GO
//
//  Created by Tatiana Rico on 15/10/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchUiSearch: UISearchBar!
    
    @IBOutlet weak var eventoImagem: UIImageView!
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    let controller = HomeController()
    let event  = EventProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoading()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        self.controller.getEvent { (success) in
            if success {
                self.homeCollectionView.reloadData()
                self.hiddenLoading()
        
            }
        }
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
     
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return controller.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellXib", for: indexPath) as? HomeCollectionViewCell
        
        cell?.setup(bussiness: controller.getItemByIndex(indexPath: indexPath))
        
        return cell ?? HomeCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetalheSpViewController") as? DetalheSpViewController {
            vc.localSp = controller.getItemByIndex(indexPath: indexPath)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
