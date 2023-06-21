//
//  SelectCityViewController.swift
//  Picker View
//
//  Created by Mohamed Elkomey on 20/06/2023.
//

import UIKit

class SelectCityViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var txtFieldSelectCity: UITextField!
    var pickerView = UIPickerView()
    var arrCities = ["Cairo", "ALex" ,"Fayoum" , "Luxor" , "Aswan"]
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //adding toolbar to the top of pickerview
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let btnDone = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closePicker))
        toolBar.setItems([btnDone], animated: true)
        //picker view will shown in bottom sheet
        txtFieldSelectCity.inputView = pickerView
        //tool bar will be shown on top op pickerView when shown
        txtFieldSelectCity.inputAccessoryView = toolBar
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
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
        currentIndex = row
        txtFieldSelectCity.text = arrCities[currentIndex]
    }
    
    
    @objc func closePicker(){
        txtFieldSelectCity.text = arrCities[currentIndex]
        view.endEditing(true)
    }
}
