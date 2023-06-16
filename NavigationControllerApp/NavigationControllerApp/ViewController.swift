//
//  ViewController.swift
//  NavigationControllerApp
//
//  Created by Mohamed Elkomey on 16/06/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //title for navigation
        title = "Navigation app"
    }

    @IBAction func btnNavigate(_ sender: Any) {
        let viewControllerSecondUI = self.storyboard?.instantiateViewController(withIdentifier: "secondUIID")
        navigationController?.pushViewController(viewControllerSecondUI!, animated: true)
    }
    
}

