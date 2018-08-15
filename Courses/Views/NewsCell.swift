//
//  NewsCell.swift
//  Courses
//
//  Created by Baha Ganyev on 15.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setDataNews(newsData: NewsResult) {
        nameLabel.text = newsData.title
        descLabel.text = newsData.description
        dateLabel.text = "Добавлено: \(newsData.added!)"
        guard let mainImagePath = newsData.news_image else {
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
