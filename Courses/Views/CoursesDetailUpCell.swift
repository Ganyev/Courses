//
//  CoursesDetailUpCell.swift
//  Courses
//
//  Created by Baha Ganyev on 09.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class CoursesDetailUpCell: UITableViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setDetails(detail: CourseDetail) {
        nameLabel.text = detail.title
        
        logoImage.layer.borderWidth = 1
        logoImage.layer.masksToBounds = false
        logoImage.layer.borderColor = UIColor.black.cgColor
        logoImage.layer.cornerRadius = logoImage.frame.height/2
        logoImage.clipsToBounds = true
        
        guard let mainImagePath = detail.main_image_url else {
            return
        }
        guard let url = URL(string: mainImagePath) else {
            return
        }
        mainImage.kf.setImage(with: url)
        
        guard let logoImagePath = detail.logo_image_url else {
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
