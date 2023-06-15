//
//  UserViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 14/06/2023.
//

import UIKit

class UsersViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate {

    var arrNames = [String]()
    
    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldName.delegate=self
        tableView.delegate=self
        tableView.dataSource=self
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    @IBAction func btnAddUser(_ sender: Any) {
        if let name = txtFieldName.text {
            //arrNames.append(name)
            arrNames.insert(name, at: 0)
            //let indexPath = IndexPath(row: arrNames.count - 1 , section: 0)
            
            let indexPath = IndexPath(row: 0 , section: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
            txtFieldName.text = ""
            view.endEditing(true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = arrNames[indexPath.row]
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arrNames.swapAt(sourceIndexPath.row
                        , destinationIndexPath.row)
    }
    
    //trailing configs
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "") { action, view, completionHandler in
            self.arrNames.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            completionHandler(true)
        }
        
        let favouriteAction = UIContextualAction(style: .normal, title: "") { (_, _, _) in
            print("Added to favourites")
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        favouriteAction.image=UIImage(systemName: "heart")
        favouriteAction.backgroundColor = UIColor.purple
        return UISwipeActionsConfiguration(actions: [deleteAction ,favouriteAction ])
    }
    
    ///leading configs
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            self.arrNames.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            completionHandler(true)
        }
        
        let favouriteAction = UIContextualAction(style: .normal, title: "Favourite") { (_, _, _) in
            print("Added to favourites")
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        favouriteAction.image=UIImage(systemName: "heart")
        favouriteAction.backgroundColor = UIColor.purple
        return UISwipeActionsConfiguration(actions: [deleteAction ,favouriteAction ])
    }
    
}
