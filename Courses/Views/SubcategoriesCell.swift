//
//  SubcategoriesCell.swift
//  Courses
//
//  Created by Baha Ganyev on 08.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

//var subcat: Subcategory?

class SubcategoriesCell: UICollectionViewCell {
    
    @IBOutlet weak var subCatImage: UIImageView!
    @IBOutlet weak var subCatName: UILabel!
    
    func setSubcategories(subcat: Subcategory) {
        subCatName.text = subcat.title
        guard let imagePath = subcat.subcategory_image_url else {
            return
        }
        guard let url = URL(string: imagePath) else {
            return
        }
        subCatImage.kf.setImage(with: url)
    }
    
}
