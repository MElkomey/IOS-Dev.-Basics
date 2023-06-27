//
//  TableViewController.swift
//  Animations
//
//  Created by Mohamed Elkomey on 26/06/2023.
//

import UIKit

class TableViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    var arrNames = ["Mohamed " , "salem" , "abd elrahman" , "sayed" , "Mohamed " , "salem" , "abd elrahman" , "sayed", "Mohamed " , "salem" , "abd elrahman" , "sayed","Mohamed " , "salem" , "abd elrahman" , "sayed","Mohamed " , "salem" , "abd elrahman" , "sayed","Mohamed " , "salem" , "abd elrahman" , "sayed","Mohamed " , "salem" , "abd elrahman" , "sayed"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")!
        cell.textLabel?.text = arrNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animate(withDuration: 0.35) {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
    }



}
