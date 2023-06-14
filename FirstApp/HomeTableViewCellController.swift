//
//  HomeTableViewCellControllerTableViewCell.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 13/06/2023.
//

import UIKit

class HomeTableViewCellController: UITableViewCell {

    @IBOutlet weak var imgFruit: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescreption: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnAddToFavourites: UIButton!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(image:UIImage , name:String ,price:Double , descreption:String ){
        
        imgFruit.image = image
        lblName.text = name
        lblPrice.text = "\(price) EGP"
        lblDescreption.text = descreption
    }

}
