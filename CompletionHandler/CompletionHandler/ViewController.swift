//
//  ViewController.swift
//  CompletionHandler
//
//  Created by Mohamed Elkomey on 26/06/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnGoNext(_ sender: Any) {
        let userID = self.storyboard?.instantiateViewController(withIdentifier: "userID")
        userID!.modalPresentationStyle = .fullScreen
        present(userID!, animated: true) {
            print("Completed")
        }
    }
    
}

