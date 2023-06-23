//
//  ViewController.swift
//  Localization App
//
//  Created by Mohamed Elkomey on 22/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var btnChangeLang: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // app will run in system language
        lblHello.text = NSLocalizedString("hello", comment: "hello label in home screen")
        btnChangeLang.setTitle(NSLocalizedString("changeLanguage", comment: ""), for: .normal)
        
    }


    @IBAction func btnChangeLanguage(_ sender: Any) {
        let currentLang = Locale.current.languageCode
        let newLang = currentLang == "ar" ? "en" : "ar"
        UserDefaults.standard.setValue([newLang], forKey: "AppleLanguages")
        showCloseAlert()
    }
    
    func showCloseAlert(){
        let alert = UIAlertController(title: "Application needs to relaunch", message: "press OK", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler:{_ in

            exit(0)
        }))
        present(alert, animated: true, completion: nil)
    }

}

