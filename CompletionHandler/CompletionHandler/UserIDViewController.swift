//
//  UserIDViewController.swift
//  CompletionHandler
//
//  Created by Mohamed Elkomey on 26/06/2023.
//

import UIKit

class UserIDViewController: UIViewController {

   var arrNames = [User]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
    

    @IBAction func btnGetData(_ sender: Any) {
        NetworkManager.shared.getUsers { users in
            self.arrNames.append(contentsOf: users)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension UserIDViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = arrNames[indexPath.row].name
        return cell
    }
}

struct User : Codable{
    let id : Int
    let name : String
    let email : String
}
