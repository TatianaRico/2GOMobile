//
//  TelaDoEventoCollectionViewCell.swift
//  2GO
//
//  Created by Tatiana Rico on 09/11/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit
import SDWebImage

class TelaDoEventoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageEvento: UIImageView!
    @IBOutlet weak var titleEvento: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(event: Event?) {
        imageEvento?.sd_setImage(with: URL(string: event?.logo?.original?.url ?? ""), completed: nil)
        titleEvento.text = event?.name?.text ?? ""
    }

}
