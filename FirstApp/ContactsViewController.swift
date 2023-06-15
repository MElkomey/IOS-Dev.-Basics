//
//  ContactsViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 14/06/2023.
//

import UIKit

class ContactsViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    var arrSections = ["A" , "M" , "S"]
    var arrNames = [
        ["Ali" , "Ahmed" , "ALaa"],
        ["Mohamed" , "Mahmoud"],
        ["Salem" , "sayed"]
    ]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNames[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = arrNames[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrSections[section]
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer for section \(arrSections[section])"
    }
}
