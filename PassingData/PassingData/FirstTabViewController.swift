//
//  FirstTabViewController.swift
//  PassingData
//
//  Created by Mohamed Elkomey on 19/06/2023.
//

import UIKit

let bgNotificationKey = "com.Elkomey.changeBackground"

class FirstTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPostNotification(_ sender: Any) {
        let color = UIColor.gray
        NotificationCenter.default.post(name: Notification.Name(bgNotificationKey), object: color)
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
