//
//  TableViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 13/06/2023.
//

import UIKit

class TableViewController : UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var arrNames : [String] = ["Mohamed" , "Ali" , "Shalaby" , "Som3aa"]
    
    @IBOutlet weak var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrNames[indexPath.row])
    }
    
}
