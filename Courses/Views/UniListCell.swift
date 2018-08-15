//
//  UniListCell.swift
//  Courses
//
//  Created by Baha Ganyev on 15.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class UniListCell: UICollectionViewCell {
    @IBOutlet weak var uniImage: UIImageView!
    @IBOutlet weak var uniName: UILabel!
    
    func setDataUni(uni: allUnis) {
        uniName.text = uni.title
        guard let mainImagePath = uni.category_image_url else {
            return
        }
        guard let url = URL(string: mainImagePath) else {
            return
        }
        uniImage.kf.setImage(with: url)
    }
}
