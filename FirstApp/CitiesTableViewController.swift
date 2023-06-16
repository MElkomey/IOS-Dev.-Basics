//
//  CitiesTableViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 15/06/2023.
//

import UIKit

class CitiesTableViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    var arrCities = [UIImage(named: "img_cairo") ,UIImage(named: "img_dubai"),UIImage(named: "img_riyadh"),UIImage(named: "img_amman")]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as! CitiesTableViewCell
        cell.cityImageView.image = arrCities[indexPath.row]
        return cell
    }
    

    // auto sized cell depend on each image height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let photo = arrCities[indexPath.row]
        let photoWidthRatio = photo!.size.width / photo!.size.height
        return tableView.frame.width / photoWidthRatio
    }
}
