//
//  EditWaypointViewController.swift
//  Trax
//
//  Created by Sayanee Basu on 20/1/16.
//  Copyright © 2016 Sayanee Basu. All rights reserved.
//

import UIKit

class EditWaypointViewController: UIViewController {

    var waypointToEdit: EditableWaypoint?
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            updateUI()
        }
    }
    @IBOutlet weak var infoTextField: UITextField! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        nameTextField?.text = waypointToEdit?.name
        infoTextField?.text = waypointToEdit?.info
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
}
