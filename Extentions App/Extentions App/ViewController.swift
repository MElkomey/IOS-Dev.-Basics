//
//  ViewController.swift
//  Extentions App
//
//  Created by Mohamed Elkomey on 26/06/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btnPrintName: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnPrintName.setTitle("Submit".localized(), for: .normal)
        btnPrintName.setTitleColor(UIColor.mainColor, for: .normal)
    }


    @IBAction func btnPrint(_ sender: Any) {
        if let name = txtName.text {
            print("name: \(name.trimt())")
        }
    }
}

extension String{
    //adding functions
    func trimt() ->String{
        return self.replacingOccurrences(of: " ", with: "-")
    }
    
    func localized() ->String{
        return NSLocalizedString(self, comment: "")
    }
}

extension UIColor{
    //adding computed properties
   static var mainColor :UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    static func primaryColor() ->UIColor{
        return UIColor(red: 244, green: 244, blue: 244, alpha: 1)
    }
}

