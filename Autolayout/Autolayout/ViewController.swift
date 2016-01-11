//
//  ViewController.swift
//  Autolayout
//
//  Created by Sayanee Basu on 11/1/16.
//  Copyright © 2016 Sayanee Basu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var loginField: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var secure: Bool = false {
        didSet { updateUI() }
    }
    
    private func updateUI() {
        passwordField.secureTextEntry = false
        passwordLabel.text = secure ? "Secured Password" : "Password"
    }
    
    @IBAction func toggleSecurity() {
        secure = !secure
    }
}

