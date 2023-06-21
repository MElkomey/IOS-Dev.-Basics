//
//  ViewController.swift
//  Custom Fonts
//
//  Created by Mohamed Elkomey on 21/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //there is a problem with hanimation font with this simple code
        //lblText.font = UIFont(name: "Hanimation", size: 20.0)
        
        for family in UIFont.familyNames {
            let name = UIFont.fontNames(forFamilyName: family)
            print("\(family)  -  \(name)")
        }
        
        lblText.font = UIFont(name: "HaniArb-Regular", size: 30.0)

    }
    
   

}

