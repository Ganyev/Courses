//
//  UniCategoriesBannerCell.swift
//  Courses
//
//  Created by Baha Ganyev on 17.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class UniCategoriesBannerCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setUniCategoriesBannerCell(uni: allUnis) {
        nameLabel.text = uni.title
        guard let mainImagePath = uni.category_image_url else {
            return
        }
        guard let url = URL(string: mainImagePath) else {
            return
        }
        imgView.kf.setImage(with: url)
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
