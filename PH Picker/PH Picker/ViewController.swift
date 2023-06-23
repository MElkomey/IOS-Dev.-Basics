//
//  ViewController.swift
//  PH Picker
//
//  Created by Mohamed Elkomey on 22/06/2023.
//

import UIKit
import PhotosUI

class ViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource ,PHPickerViewControllerDelegate{

    var arrPhotos = [UIImage]()
    
    @IBOutlet weak var tableView: UITableView!
    //phpicker works only with ios >= 14
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func btnGetPhotos(_ sender: Any) {
        getPhotosFromLibrary()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") as! PhotosTableViewCell
        cell.img.image = arrPhotos[indexPath.row]
        
        return cell
    }
    
    func  getPhotosFromLibrary(){
        //import PhotosUI
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 2
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self , completionHandler: {(image , error) in
                if let image = image as? UIImage {
                    //because completion handler works in seperate thread
                    DispatchQueue.main.async {
                        self.arrPhotos.append(image)
                        self.tableView.reloadData()
                    }
                }else{
                    
                }
            })
        }
        dismiss(animated: true, completion: nil)
    }
    

}

