//
//  CourseDetailDescriptionCell.swift
//  Courses
//
//  Created by Baha Ganyev on 11.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class CourseDetailDescriptionCell: UITableViewCell {

    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var promoButton: UIButton!
    @IBOutlet weak var branchesButton: UIButton!
    @IBOutlet weak var contactsButton: UIButton!
    @IBOutlet weak var servicesButton: UIButton!
    var delegate: CourseTypeDelegate?
    
    //Delegate
    @IBAction func buttonTapped(button: UIButton) {
        let type = CourseInfoType(rawValue: button.tag)
        delegate?.changeCourseType(type: type!)
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
