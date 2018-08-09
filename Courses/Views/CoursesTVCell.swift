//
//  CoursesTVCell.swift
//  Courses
//
//  Created by Baha Ganyev on 09.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class CoursesTVCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    
    func setCoursesList(courseList: CourseBase) {
        nameLabel.text = courseList.title
        descriptionLabel.text = courseList.description
        
        guard let mainImagePath = courseList.main_image_url else {
            return
        }
        guard let url = URL(string: mainImagePath) else {
            return
        }
        mainImage.kf.setImage(with: url)
        
        guard let logoImagePath = courseList.logo_image_url else {
            return
        }
        guard let urlLogo = URL(string: logoImagePath) else {
            return
        }
        logoImage.kf.setImage(with: url)
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
