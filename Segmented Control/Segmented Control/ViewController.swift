//
//  ViewController.swift
//  Segmented Control
//
//  Created by Mohamed Elkomey on 19/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentDidChanged(_ sender: Any) {
        print("index : \(segmentedControl.selectedSegmentIndex)")
        print("value : \(segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) ?? "")")
    }
    
}
