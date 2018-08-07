//
//  CategoriesCell.swift
//  Courses
//
//  Created by Baha Ganyev on 07.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

var cat: Category?

class CategoriesCell: UICollectionViewCell {
    @IBOutlet weak var imageCategories: UIImageView!
    @IBOutlet weak var nameCategories: UILabel!
    
    func setCategories(cat: Category) {
        cat.title = nameCategories.text
        guard let imagePath = cat.category_image_url else {
            return
        }
        guard let url = URL(string: imagePath) else {
            return
        }
        imageCategories.kf.setImage(with: url)
    }
    
    
}
