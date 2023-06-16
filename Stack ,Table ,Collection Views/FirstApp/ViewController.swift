//
//  ViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 11/06/2023.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var lblText : UILabel!
    @IBOutlet weak var txtUserName : UITextField!
    @IBOutlet weak var txtPassword : UITextField!
    @IBAction func btnLogin(_ sender : Any){
        lblText.text = "Login Succeedded"
        lblText.textColor = UIColor.green
    }
    @IBAction func btnJoin(_ sender: UIButton) {
        lblText.text = "Joined Succeedded"
        lblText.textColor = .yellow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        lblText.text="Hello Again"
        
        // link with keyboard
        txtUserName.delegate = self
        txtPassword.delegate = self
    }
    
    //when press on return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtUserName{
            txtPassword.becomeFirstResponder()
        }else{
            lblText.text = "Login Succeedded"
            view.endEditing(true)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
//        override func viewWillAppear(_ animated: Bool) {
//            print("view will appear")
//        }
//        override func viewDidAppear(_ animated: Bool) {
//            print("view Did appear")
//        }
//        override func viewWillDisappear(_ animated: Bool) {
//            print("view will disappear")
//        }
//
//        override func viewDidDisappear(_ animated: Bool) {
//            print("view Did disappear")
//        }
    
}

