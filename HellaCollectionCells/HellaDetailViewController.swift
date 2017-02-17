//
//  HellaDetailViewController.swift
//  HellaCollectionCells
//
//  Created by ac on 2/16/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

import UIKit

class HellaDetailViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    var hellaText:String?
    var color:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayText()
    }
    
    func displayText() {
        if let hellaText = hellaText {
            textLabel.text = hellaText
            textLabel.backgroundColor = color
        }
     }
    
}
