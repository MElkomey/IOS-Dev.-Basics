//
//  ViewController.swift
//  CocoaPodsApp
//
//  Created by Mohamed Elkomey on 23/06/2023.
//


//library in cocapods named NVActivityIndicatorView
//1- GO TO project file wich containg blue xcode project
//2- run terminal on file
// 3 - run
//pod init
//4 - open podfile
//5- remove # from second line in file
//6- add pod '' line from library site under the line (use_framworks)
//7-save changes
//8-in same terminal write
// pod install
// then open the white project -> .workSpace

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController {

    @IBOutlet weak var indicatorView: NVActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        indicatorView.type = .ballScaleRippleMultiple
        indicatorView.color = .blue
        indicatorView.startAnimating()
    }


}

