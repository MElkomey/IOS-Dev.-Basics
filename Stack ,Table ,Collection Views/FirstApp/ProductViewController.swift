//
//  ProductViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 16/06/2023.
//

import UIKit

class ProductViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    var arrProducts = [Product]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        arrProducts.append(Product(title: "Top Rated", products: [UIImage(named: "img_plant1")!,UIImage(named: "img_plant2")!, UIImage(named: "plant_img")!, UIImage(named: "PlantImg1")!]))
        
        arrProducts.append(Product(title: "Home", products: [UIImage(named: "PlantImg2")!,UIImage(named: "PlantImg3")!, UIImage(named: "PlantImg4")!]))
        
        arrProducts.append(Product(title: "Offers", products: [UIImage(named: "img_plant1")!,UIImage(named: "img_plant2")!, UIImage(named: "plant_img")!, UIImage(named: "PlantImg1")!]))
        
        arrProducts.append(Product(title: "Sale", products: [UIImage(named: "PlantImg2")!,UIImage(named: "PlantImg3")!, UIImage(named: "PlantImg4")!]))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "tableCell") as! ProductTableViewCell
        cell.setupCell(title: arrProducts[indexPath.row].title, arrPhotos: arrProducts[indexPath.row].products)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


}

struct Product{
    let title:String
    let products:[UIImage]
}
