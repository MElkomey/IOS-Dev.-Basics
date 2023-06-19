//
//  UserProfileViewController.swift
//  PassingData
//
//  Created by Mohamed Elkomey on 19/06/2023.
//

import UIKit

class UserProfileViewController: UIViewController ,UserDataDelegate{
  

    @IBOutlet weak var lblUserData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func didSelectUserData(name: String, age: Int, favouriteColor: UIColor) {
      lblUserData.text = "name: \(name) , age: \(age)"
        lblUserData.textColor = favouriteColor
    }

    @IBAction func btnGetUserData(_ sender: Any) {
        let userDataVC = self.storyboard?.instantiateViewController(withIdentifier: "userDataID") as! UserDataViewController
        //this line is important without data will not be shown in the label
        userDataVC.userDelegate = self
        present(userDataVC, animated: true, completion: nil)
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
