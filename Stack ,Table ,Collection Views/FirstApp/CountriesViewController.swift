//
//  CountriesViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 15/06/2023.
//

import UIKit

class CountriesViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    var arrCountries = ["Egypt" , "Saudia arabia" , "oman" , "Yemen"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        arrCountries.removeAll()
        
        //hide table view and show image by code only
        if arrCountries.count == 0 {
            tableView.isHidden = true
            
            let noDataImage = UIImageView(frame: CGRect(x: 50, y: 100, width: self.view.frame.width-100, height: 200))
            noDataImage.image = UIImage(systemName: "icloud.slash")
            noDataImage.tintColor = .gray
            self.view.addSubview(noDataImage)
            
            let lblNoData = UILabel(frame: CGRect(x: noDataImage.frame.minX, y: noDataImage.frame.maxY+15, width: noDataImage.frame.width, height: 30))
            lblNoData.text = "NO DATA TO DISPLAY"
            lblNoData.tintColor = .gray
            lblNoData.textAlignment = .center
            self.view.addSubview(lblNoData)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        cell.textLabel?.text = arrCountries[indexPath.row]
        return cell
    }
    


}
