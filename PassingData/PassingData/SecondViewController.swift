//
//  SecondViewController.swift
//  PassingData
//
//  Created by Mohamed Elkomey on 18/06/2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblSentName: UILabel!
    var userData : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = userData {
            lblSentName.text = "\(user.name) \(user.age) \(user.email) \(user.bDate)"
        }
    }
    
}

struct User{
    var name : String
    var email : String
    var age : Int
    var bDate : String
}
