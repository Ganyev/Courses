//
//  UniCategoriesCell.swift
//  Courses
//
//  Created by Baha Ganyev on 17.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class UniCategoriesCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    
    func setUniCategoriesCell(uniCatCell: UniCategories) {
        nameLabel.text = uniCatCell.title
        descriptionLabel.text = uniCatCell.description
        
        guard let mainImagePath = uniCatCell.main_image_url else {
            return
        }
        guard let url = URL(string: mainImagePath) else {
            return
        }
        mainImage.kf.setImage(with: url)
        
        guard let logoImagePath = uniCatCell.logo_image_url else {
            return
        }
        guard let urlLogo = URL(string: logoImagePath) else {
            return
        }
        logoImage.kf.setImage(with: urlLogo)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
