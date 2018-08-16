//
//  CourseBranchesCell.swift
//  Courses
//
//  Created by Baha Ganyev on 14.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

class CourseBranchesCell: UITableViewCell {

    @IBOutlet weak var branchLabel: UILabel!
    @IBOutlet weak var imgLabel: UIImageView!
    
    func setBranches(branch: Branch) {
        branchLabel.text = branch.address
        
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
