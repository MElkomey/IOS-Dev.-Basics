//
//  ViewController.swift
//  Picker View
//
//  Created by Mohamed Elkomey on 20/06/2023.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDelegate ,UIPickerViewDataSource{

    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var pickerCities: UIPickerView!
    var arrCities = ["Cairo", "ALex" ,"Fayoum" , "Luxor" , "Aswan"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerCities.delegate = self
        pickerCities.dataSource = self
        
    }


    @IBAction func grtCity(_ sender: Any) {
        lblCity.text = arrCities[pickerCities.selectedRow(inComponent: 0)]
    }
    
    //number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrCities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrCities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        lblCity.text = arrCities[row]
    }
    
    //we need this func if we will change the titles font attributes as it cant be changed from attributes inspector

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) ->  NSAttributedString? {
        return NSAttributedString(string: arrCities[row], attributes: [NSAttributedString.Key.foregroundColor :UIColor.white])
    }
    
}

