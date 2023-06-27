//
//  ViewController.swift
//  ExceptionHandling
//
//  Created by Mohamed Elkomey on 26/06/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtUserNmae: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func btnSignUp(_ sender: Any) {
    }
}

extension String{
    func isvalidUserName() -> String {
        
    }
}


