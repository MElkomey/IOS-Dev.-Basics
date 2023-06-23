//
//  ViewController.swift
//  Take Photo App
//
//  Created by Mohamed Elkomey on 22/06/2023.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{

    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnTakePhoto(_ sender: Any) {
        showAlertView()
    }
    
    
    func showAlertView(){
        let alert = UIAlertController(title: "Take photo from", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {action in
            self.getPhoto(type: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {action in
            self.getPhoto(type: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    //you must give permissions for info.plist
    func getPhoto(type : UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            print("didn't pick any image")
            return
        }
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

