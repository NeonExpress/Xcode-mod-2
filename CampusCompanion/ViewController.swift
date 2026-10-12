//
//  ViewController.swift
//  CampusCompanion
//
//  Created by JAYMAR DELOS SANTOS on 10/1/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    

    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Campus Companion"
    }
    @IBAction func getStartedTapped(_ sender: UIButton) {
        subtitleLabel.text = "Let's get Started!"
    }

    

}

