//
//  PlantCollectionViewCell.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 15/06/2023.
//

import UIKit

class PlantCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    
    func setupCell(image:UIImage , price:Double){
        imageView.image = image
        lblText.text = "\(price) EGP"
    }
}
