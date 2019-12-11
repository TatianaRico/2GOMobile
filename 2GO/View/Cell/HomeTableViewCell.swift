//
//  HomeCollectionViewCell.swift
//  2GO
//
//  Created by Tatiana Rico on 20/10/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleCategoryLabel: UILabel!
    @IBOutlet weak var eventoImage: UIImageView!
    
    var localSp: Business?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(bussiness: Business) {
        titleCategoryLabel.text = bussiness.name
        eventoImage?.sd_setImage(with: URL(string: bussiness.imageURL))
    }
}

