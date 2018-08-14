//
//  CourseActionsCell.swift
//  Courses
//
//  Created by Baha Ganyev on 14.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class CourseActionsCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setActions(action: Action) {
        nameLabel.text = action.title
        descLabel.text = action.description
        dateLabel.text = "Действует до: \(action.end_date!)"
        guard let mainImagePath = action.action_image else {
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
