//
//  FourthTabViewController.swift
//  PassingData
//
//  Created by Mohamed Elkomey on 19/06/2023.
//

import UIKit

class FourthTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(changeBackground), name: Notification.Name(bgNotificationKey), object: nil)
    }
    
    @objc func changeBackground(_ notification : Notification){
        if let color = notification.object as? UIColor{
            view.backgroundColor = color
        }
       
    }
    
    
    // for memory optimization and not to many observers remain in system
    deinit{
        NotificationCenter.default.removeObserver(self)
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
