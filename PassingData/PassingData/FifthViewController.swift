//
//  FifthViewController.swift
//  PassingData
//
//  Created by Mohamed Elkomey on 18/06/2023.
//

import UIKit

class FifthViewController: UIViewController {

    
    var myData = ""
    @IBOutlet weak var lblData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblData.text = myData
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcFourth = segue.destination as? FourthViewController{
            vcFourth.myData = "Data from fifth cv"
        }
    }

}
