//
//  CourseContactsCell.swift
//  Courses
//
//  Created by Baha Ganyev on 11.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

class CourseContactsCell: UITableViewCell {

    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    func setContacts(contact: Contact) {
        contactButton.setTitle(contact.contact, for: .normal)
        contactButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        if contact.type == "PHONE" {
            imgView.image = #imageLiteral(resourceName: "call")
        }
        if contact.type == "WEBSITE" {
            imgView.image = #imageLiteral(resourceName: "world")
        }
        if contact.type == "FACEBOOK" {
            imgView.image = #imageLiteral(resourceName: "facebook")
        }
        if contact.type == "EMAIL" {
            imgView.image = #imageLiteral(resourceName: "email")
        }
        
    }
    
    var textContact: Contact?

    
    @IBAction func callPhoneNumber() {
        guard let url = URL(string: textContact!.contact!) else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
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
