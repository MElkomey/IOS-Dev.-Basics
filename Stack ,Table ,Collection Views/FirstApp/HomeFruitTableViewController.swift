//
//  HomeFruitTableViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 13/06/2023.
//

import UIKit

class HomeFruitTableViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    var fruits  = [Fruit]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fruits.append(Fruit.init(image: UIImage(named: "img_orange")!, name: "Orange", price: 12.0, descreption: "This fruit is loved by all ages"))
        fruits.append(Fruit.init(image: UIImage(named: "img_apple")!, name: "Apple", price: 10.0, descreption: "This fruit is loved by all ages"))
        fruits.append(Fruit.init(image: UIImage(named: "img_mango")!, name: "Mango", price: 19.0, descreption: "This fruit is loved by all ages"))
        fruits.append(Fruit.init(image: UIImage(named: "img_banana")!, name: "Banana", price: 8.0, descreption: "This fruit is loved by all ages"))
        fruits.append(Fruit.init(image: UIImage(named: "img_papaya")!, name: "Papaya", price: 16.0, descreption: "This fruit is loved by all ages"))
         }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCellController
        let data = fruits[indexPath.row]
        cell.setupCell(image: data.image, name: data.name, price: data.price, descreption: data.descreption)
        cell.btnAddToFavourites.tag = indexPath.row
        // press on btn give me target(some prosedures)
        cell.btnAddToFavourites.addTarget(self, action: #selector(addToFavourites(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(fruits[indexPath.row].name)
    }
    
    ///objective c func
    @objc
    func addToFavourites(sender:UIButton){
        print("Button of \(sender.tag)")
        if sender.currentImage == UIImage(systemName: "heart"){
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }

}

struct Fruit{
    let  image:UIImage
    let name:String
    let price:Double
    let descreption:String
}
