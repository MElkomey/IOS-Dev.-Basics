//
//  UserDataViewController.swift
//  PassingData
//
//  Created by Mohamed Elkomey on 19/06/2023.
//

import UIKit
// used to pass data back to previos screen
protocol UserDataDelegate{
    func didSelectUserData(name:String , age:Int , favouriteColor:UIColor)
}

class UserDataViewController: UIViewController {
    var userDelegate:UserDataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnBackToUserProfile(_ sender: Any) {
        //give data to instance from protocol
        userDelegate?.didSelectUserData(name: "Mohamed", age: 23, favouriteColor: .brown)
        
        //to close the present page
        dismiss(animated: true, completion: nil)
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
