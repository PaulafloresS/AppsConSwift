//
//  WelcomeViewController.swift
//
//  Created by Ana Paula Flores on 01/03/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "⚡️FlashChat"
       
    }

}
