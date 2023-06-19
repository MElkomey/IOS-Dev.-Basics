//
//  ViewController.swift
//  UISwitch
//
//  Created by Mohamed Elkomey on 19/06/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func switchChanges(_ sender: UISwitch) {
        print("enabled : \(sender.isOn)")
    }
    
}

