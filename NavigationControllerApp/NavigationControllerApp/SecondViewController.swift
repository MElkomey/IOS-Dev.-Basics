//
//  SecondViewController.swift
//  NavigationControllerApp
//
//  Created by Mohamed Elkomey on 17/06/2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        // remove background image
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        //to return line under navigation bar
        navigationController?.navigationBar.shadowImage = nil
        
        //customize secodUI back arrow
        
        let btnBack = UIBarButtonItem()
        btnBack.title = "< To Home"
        btnBack.target = self
        btnBack.action = #selector(goToHome)
        navigationItem.leftBarButtonItem = btnBack
        
        //to unhide navigation bar in all next ,current or back screens
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func goToHome(){
        navigationController?.popViewController(animated: true)
    }


}
