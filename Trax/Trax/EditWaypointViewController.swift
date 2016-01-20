//
//  EditWaypointViewController.swift
//  Trax
//
//  Created by Sayanee Basu on 20/1/16.
//  Copyright © 2016 Sayanee Basu. All rights reserved.
//

import UIKit

class EditWaypointViewController: UIViewController, UITextFieldDelegate {

    var waypointToEdit: EditableWaypoint? {
        didSet {
            updateUI()
        }
    }

    @IBOutlet weak var nameTextField: UITextField! { didSet { nameTextField.delegate = self } }
    @IBOutlet weak var infoTextField: UITextField! { didSet { infoTextField.delegate = self } }
    
    func updateUI() {
        nameTextField?.text = waypointToEdit?.name
        infoTextField?.text = waypointToEdit?.info
    }
    
    
    @IBAction func done(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        observeTextFields()
    }
    
    var ntfObserver: NSObjectProtocol?
    var itfObserver: NSObjectProtocol?
    
    func observeTextFields() {
        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        
        ntfObserver = center.addObserverForName(UITextFieldTextDidChangeNotification,
            object: nameTextField, queue: queue) { notification in
                if let waypoint = self.waypointToEdit {
                    waypoint.name = self.nameTextField.text
                }
        }
        
        itfObserver = center.addObserverForName(UITextFieldTextDidChangeNotification,
            object: infoTextField, queue: queue) { notification in
                if let waypoint = self.waypointToEdit {
                    waypoint.info = self.infoTextField.text
                }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let observer = ntfObserver {
            NSNotificationCenter.defaultCenter().removeObserver(observer)
        }
        
        if let observer = itfObserver {
            NSNotificationCenter.defaultCenter().removeObserver(observer)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()
        updateUI()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
