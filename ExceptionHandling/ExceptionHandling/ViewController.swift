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
        do {
            try signUp()
        }catch SignUpError.invalidUserName{
                print("Invalid Username")
        }catch SignUpError.invalidEmail{
                print("Invalid Email")
        }catch SignUpError.invalidMobile{
                print("Invalid Mobile")
        }catch SignUpError.invalidPassword{
                print("Invalid Password")
        }catch {
            print("error : \(error)")
        }
    }
    
    func signUp() throws {
        let userName = txtUserNmae.text!
        let email = txtEmail.text!
        let mobile = txtMobile.text!
        let password = txtPassword.text!
        
        if !userName.isvalidUserName {
            throw SignUpError.invalidUserName
        }
        if !email.isValidEmail {
            throw SignUpError.invalidEmail
        }
        if !mobile.isValidMobile {
            throw SignUpError.invalidMobile
        }
        if !password.isValidPassword {
            throw SignUpError.invalidPassword
        }
        
        print ("Signed up")
    }
}

extension String{
    var isvalidUserName : Bool {
        return self.count > 3
    }
    
    var isValidEmail : Bool {
        let format = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
        + "[_A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", format)
        return predicate.evaluate(with: self)
    }
    
    var isValidMobile : Bool {
        //egypt format
       // "^(00201|201|\\+201|01)(0|1|2)([0-9]{8})$"
        //ksa format
        let format = "^(009665|9665|\\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", format)
        return predicate.evaluate(with: self)
    }
    
    var isValidPassword : Bool {
        return self.count > 5
    }
}

enum SignUpError : Error {
    case invalidUserName
    case invalidEmail
    case invalidMobile
    case invalidPassword
}


