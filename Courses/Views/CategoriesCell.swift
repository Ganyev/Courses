//
//  CategoriesCell.swift
//  Courses
//
//  Created by Baha Ganyev on 07.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

//var cat: Category?

class CategoriesCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setCategories(category: Category) {
        nameLabel.text = category.title
        guard let imagePath = category.category_image_url else {
            return
        }
        guard let url = URL(string: imagePath) else {
            return
        }
        imgView.kf.setImage(with: url)
    }
    
    
}
