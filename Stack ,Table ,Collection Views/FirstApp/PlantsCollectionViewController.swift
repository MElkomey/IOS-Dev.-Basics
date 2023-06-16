//
//  PlantsCollectionViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 15/06/2023.
//

import UIKit

class PlantsCollectionViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    var arrPlants = [Plant]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        arrPlants.append(Plant(Image: UIImage(named: "img_plant1")!, price: 200))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant2")!, price: 244))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant2")!, price: 885))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant1")!, price: 363))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant1")!, price: 77))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant2")!, price: 989))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant1")!, price: 200))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant2")!, price: 244))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant2")!, price: 885))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant1")!, price: 363))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant1")!, price: 77))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant2")!, price: 989))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant1")!, price: 200))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant2")!, price: 244))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant2")!, price: 885))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant1")!, price: 363))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant1")!, price: 77))
        arrPlants.append(Plant(Image: UIImage(named: "img_plant2")!, price: 989))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPlants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plantCell", for: indexPath) as! PlantCollectionViewCell
        let data = arrPlants[indexPath.row]
        cell.setupCell(image: data.Image, price: data.price)
//cell.backgroundColor = .orange
        return cell
    }
    
    // customize cell width and height depends on screen size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.3, height: self.view.frame.width * 0.45)
    }

    // customize space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 2, bottom: 1, right: 2)
    }
}

struct Plant{
    var Image:UIImage
    var price:Double
}
