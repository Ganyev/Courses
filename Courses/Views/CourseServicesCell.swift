//
//  CourseServicesCell.swift
//  Courses
//
//  Created by Baha Ganyev on 11.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

class CourseServicesCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    
    func setServices(service: Service) {
        nameLabel.text = service.title
        descriptionLabel.text = service.description
        priceLable.text = "Цена: \(service.price!)"
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
