//
//  ViewController.swift
//  Slider
//
//  Created by Mohamed Elkomey on 20/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSlider: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderChange(_ sender: UISlider) {
        print("value = \(sender.value)")
        lblSlider.font = UIFont(name: lblSlider.font.fontName, size: CGFloat(sender.value))
    }
    
}

