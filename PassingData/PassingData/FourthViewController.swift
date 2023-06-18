//
//  FourthViewController.swift
//  PassingData
//
//  Created by Mohamed Elkomey on 18/06/2023.
//

import UIKit

class FourthViewController: UIViewController {

    var myData = ""
    @IBOutlet weak var lblData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblData.text = myData
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcFifth =  segue.destination as? FifthViewController{
            vcFifth.myData = "data from fourth vc "
        }    }
    
    //for linking right click and pull to exit point on the fifth screen viewc storyboard
    @IBAction func unWindTo4 (sender: UIStoryboardSegue){
        lblData.text =  myData  
    }

}
