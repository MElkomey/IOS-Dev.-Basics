//
//  ViewController.swift
//  Page View Controller
//
//  Created by Mohamed Elkomey on 20/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDescreption: UILabel!
    
    var titleText :String?
    var descreptionText :String?
    var bgColor :UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = titleText {
            lblTitle.text = title
        }
        
        if let descreption = descreptionText {
            lblDescreption.text = descreption
        }
        
        if let color = bgColor {
            view.backgroundColor = color
        }
    }


}

