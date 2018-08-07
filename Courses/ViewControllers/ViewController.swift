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
        ServerManager.shared.getCategories(completion: printCategories) { (error) in
            print(error)
        }
    }
    
    func printCategories(categories: [Category]) {
        for i in categories {
            print(i.title!)
        }
        
    }


}

