//
//  TextViewController.swift
//  Psychologist
//
//  Created by Sayanee Basu on 4/1/16.
//  Copyright © 2016 Sayanee Basu. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = "" {
        didSet {
            textView?.text = text
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if textView != nil && presentingViewController != nil {
                return textView.sizeThatFits(presentingViewController!.view.bounds.size)
            } else {
                return super.preferredContentSize
            }
        }
        set {
            super.preferredContentSize = newValue
        }
    }
    
}
