//
//  ViewController.swift
//  Swift Package Manager App
//
//  Created by Mohamed Elkomey on 23/06/2023.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController {

    var indicatorView : NVActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        indicatorView = NVActivityIndicatorView(frame: CGRect(x: (view.frame.width / 2) - 120 , y: (view.frame.height / 2) - 64, width: 240, height: 128), type: .orbit, color: UIColor.cyan, padding: 0)
        indicatorView?.startAnimating()
        view.addSubview(indicatorView!)
    }


}

