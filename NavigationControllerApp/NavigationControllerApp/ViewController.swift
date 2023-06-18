//
//  ViewController.swift
//  NavigationControllerApp
//
//  Created by Mohamed Elkomey on 16/06/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //title for navigation
        title = "Navigation app"
        
        //code will be applied for all srceens for navigation contoller editing if stayed in viewDidLoad
        //title style large boolean
       
        //add bar button item by code only with title
//        var btnLogout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
//        navigationItem.rightBarButtonItem = btnLogout
        
        //add bar button item by code only with image
        
        let btnLogout = UIBarButtonItem()
        btnLogout.image = UIImage(systemName: "power")
        btnLogout.action = #selector(logout)
        btnLogout.target = self
        navigationItem.rightBarButtonItem = btnLogout
        

        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        
        //navigation bar colors
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.backgroundColor = UIColor.white
       //navigationController?.navigationBar.barTintColor = UIColor.white
        
        //change title attributes
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.green ,NSAttributedString.Key.font : UIFont(name: "Helvetica-Bold", size: 15)!]
       
        // set background image
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //to remove line under navigation bar
        navigationController?.navigationBar.shadowImage = UIImage()
        //to set a title image
        navigationItem.titleView = UIImageView(image: UIImage(named: "ic_logo"))
        //to hide navigation bar in all next ,current or back screens
       // navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func logout(){
        print("Logout user code")
    }

    //code to connect two screen in navigation by code not story board
//    @IBAction func btnNavigate(_ sender: Any) {
//        let viewControllerSecondUI = self.storyboard?.instantiateViewController(withIdentifier: "secondUIID")
//        navigationController?.pushViewController(viewControllerSecondUI!, animated: true)
//    }
    
    //bar button item
    @IBAction func btnBarLogout(_ sender: Any) {
        print("logout code")
    }
    
}

