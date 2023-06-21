//
//  ViewController.swift
//  Dark Mode
//
//  Created by Mohamed Elkomey on 21/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        switch traitCollection.userInterfaceStyle {
            
        case .light :
            lblText.text = "Light Mode"
        case .dark :
            lblText.text = "Dark Mode"
        default :
            lblText.text = "Unspeciefied"
        }
        
        // to make app without dark mode go to info.plist , add properety of Appearance - string - Light
    }


}

