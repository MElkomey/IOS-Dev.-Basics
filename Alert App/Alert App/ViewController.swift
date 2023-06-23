//
//  ViewController.swift
//  Alert App
//
//  Created by Mohamed Elkomey on 22/06/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAlertView(_ sender: Any) {
        showAlertView()
    }
    
    @IBAction func btnActionSheet(_ sender: Any) {
        showActionSheet()
    }
    
    func showAlertView(){
        let alert = UIAlertController(title: "Alert title", message: "Alert Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Action 1 title", style: .default, handler: {action in print("Action 1 clicked")}))
        alert.addAction(UIAlertAction(title: "Action 2 title", style: .cancel, handler: nil))//shown first left or down
        alert.addAction(UIAlertAction(title: "Action 3 title", style: .destructive, handler: {action in
            let txtName = alert.textFields![0].text!
            print("Action 3 clicked , name: \(txtName)")}))
        //adding textField
        alert.addTextField{(txtName) in
            txtName.placeholder = "Name"
        }
       present(alert, animated: true, completion: nil)
    }
    
    
    func showActionSheet(){
        let alert = UIAlertController(title: "Action sheet title", message: "action sheet message", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "action 1 title", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "action 2 title", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "action 3 title", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

