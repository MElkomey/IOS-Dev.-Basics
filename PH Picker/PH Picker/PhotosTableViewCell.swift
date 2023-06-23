//
//  PhotosTableViewCell.swift
//  PH Picker
//
//  Created by Mohamed Elkomey on 22/06/2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

   
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
