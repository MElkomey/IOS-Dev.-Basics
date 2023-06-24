//
//  ViewController.swift
//  Localization App
//
//  Created by Mohamed Elkomey on 22/06/2023.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var btnOpenCam: UIButton!
    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var btnChangeLang: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // app will run in system language
        lblHello.text = NSLocalizedString("hello", comment: "hello label in home screen")
        btnChangeLang.setTitle(NSLocalizedString("changeLanguage", comment: ""), for: .normal)
        btnOpenCam.setTitle(NSLocalizedString("openCamera", comment: ""), for: .normal)
     
        //prevent all view components from being from right to left automatically
        view.semanticContentAttribute = .forceLeftToRight
    }


    @IBAction func btnChangeLanguage(_ sender: Any) {
        //command to change language
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
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnOpenCamera(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = self
        picker.sourceType = .camera
        present(picker,animated: true , completion: nil)
    }
    
    
}

