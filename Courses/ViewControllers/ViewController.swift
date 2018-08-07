//
//  ViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 07.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getSubCategories(categoryid: 2, completion: printSubcategories) { (error) in
            print(error)
        }
    }
    
    
    func printSubcategories(subcat: [Subcategory]) {
        for i in subcat {
            print(i.title!)
        }
    }


}

