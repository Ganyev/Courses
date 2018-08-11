//
//  CourseContactsCell.swift
//  Courses
//
//  Created by Baha Ganyev on 11.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class CourseContactsCell: UITableViewCell {

    @IBOutlet weak var contactLabel: UILabel!
    
    func setContacts(contact: Contact) {
        contactLabel.text = contact.contact
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
