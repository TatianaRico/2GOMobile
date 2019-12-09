//
//  HomeCollectionViewCell.swift
//  2GO
//
//  Created by Tatiana Rico on 20/10/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleCategoryLabel: UILabel!
    @IBOutlet weak var eventoImage: UIImageView!
    
          var localSp: Business?
        
        
        override func awakeFromNib() {
            super.awakeFromNib()
    //        self.layer.borderWidth = 2
    //        self.layer.borderColor = UIColor.init(red: CGFloat(Int.random(in: 0...50))/255, green: CGFloat(Int.random(in: 0...50))/255, blue: CGFloat(Int.random(in: 240...255))/255, alpha: 1).cgColor
    //        self.backgroundColor = .lightGray
    //        self.layer.cornerRadius = 4.0
        }

        func setup(bussiness: Business) {
            titleCategoryLabel.text = bussiness.name
            eventoImage?.sd_setImage(with: URL(string: bussiness.imageURL ?? ""))
        }
    }

