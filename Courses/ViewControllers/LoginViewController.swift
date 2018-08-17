//
//  LoginViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 17.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import FacebookLogin

class LoginViewController: UIViewController {

    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        view.addSubview(loginButton)
    }
    

    
}
