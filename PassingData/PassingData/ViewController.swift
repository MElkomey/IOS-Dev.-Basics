//
//  ViewController.swift
//  PassingData
//
//  Created by Mohamed Elkomey on 18/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSendToNext(_ sender: Any) {
        let secondUI = self.storyboard?.instantiateViewController(withIdentifier: "secondID") as! SecondViewController
        secondUI.userData = User(name: "Ahmed" , email: "b.C@e", age: 12, bDate: "10/8/2022")
        secondUI.modalPresentationStyle = .fullScreen
        //if first screen was embedded in navigation controller in story board
        //navigationController?.pushViewController(secondUI, animated: true)
        //if screens was not embedded in navigation controller
        present(secondUI, animated: true, completion: nil)
    }
    
}

