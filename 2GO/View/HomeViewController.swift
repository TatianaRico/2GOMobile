//
//  HomeViewController.swift
//  2GO
//
//  Created by Tatiana Rico on 15/10/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    let controller = HomeController()
    let event  = EventProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoading()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        self.controller.getEvent { (success) in
            if success {
                self.homeTableView.reloadData()
                self.hiddenLoading()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfItemsInSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 199
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        
        cell.setup(bussiness: controller.getItemByIndex(indexPath: indexPath))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetalheSpViewController") as? DetalheSpViewController {
            vc.localSp = controller.getItemByIndex(indexPath: indexPath)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
