//
//  ThirdViewController.swift
//  PassingData
//
//  Created by Mohamed Elkomey on 18/06/2023.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var lblData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//this function is called automatic if there is segue between two view controllers and the user pressed the button used for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goto4"{
//
//        }
            //or //if segue.destination == FourthViewController(){}
            
        // or
        if let vcFourth =  segue.destination as? FourthViewController{
            vcFourth.myData = "data from third vc "
        }
        
    }

}
