//
//  ContainerViewController.swift
//  PassingData
//
//  Created by Mohamed Elkomey on 19/06/2023.
//

import UIKit

class ContainerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //make second tab vc start observing without visit and load first
        let vc = viewControllers![1] as! SecondTabViewController
        NotificationCenter.default.addObserver(vc, selector: #selector(vc.changeBackground), name: Notification.Name(bgNotificationKey), object: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
