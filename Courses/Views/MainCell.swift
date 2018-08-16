//
//  MainCell.swift
//  Courses
//
//  Created by Baha Ganyev on 14.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

class MainCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var heshtagLabel: UILabel!
    
    func setMainData(main: CourseBase) {
        nameLabel.text = main.title
        descLabel.text = main.description
        heshtagLabel.text = "Категории:"
        guard let logoImagePath = main.logo_image_url else {
            return
        }
        guard let urlLogo = URL(string: logoImagePath) else {
            return
        }
        logoImage.kf.setImage(with: urlLogo)
        
        guard let mainImagePath = main.main_image_url else {
            return
        }
        guard let url = URL(string: mainImagePath) else {
            return
        }
        mainImage.kf.setImage(with: url)
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
