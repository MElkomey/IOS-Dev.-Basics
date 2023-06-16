//
//  NumbersViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 14/06/2023.
//

import UIKit

class NumbersViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    var arrNumbers = [String]()
    @IBOutlet weak var tableView: UITableView!
    var refreshController = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        refreshController.tintColor = UIColor.gray
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        tableView.addSubview(refreshController)
    }
    
    @objc func refresh(){
        arrNumbers.append("Value \(arrNumbers.count+1)")
        refreshController.endRefreshing()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath)
        cell.textLabel?.text = arrNumbers[indexPath.row]
        return cell
    }


}
