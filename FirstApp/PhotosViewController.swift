//
//  PhotosViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 16/06/2023.
//

import UIKit

class PhotosViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    var arrPhoto = [Photo]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        arrPhoto.append(Photo(name: "2019", photos: [UIImage(named: "img_place1")!,UIImage(named: "img_place2")!,UIImage(named: "img_place3")!]))
        arrPhoto.append(Photo(name: "2020", photos: [UIImage(named: "img_place4")!,UIImage(named: "img_place5")!,UIImage(named: "img_place6")!,UIImage(named: "img_place7")!]))
        arrPhoto.append(Photo(name: "2021", photos: [UIImage(named: "img_place8")!,UIImage(named: "img_place9")!]))
        
        arrPhoto.reverse()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrPhoto.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPhoto[section].photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotosCollectionViewCell
        cell.imgPlacePhoto.image = arrPhoto[indexPath.section].photos[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width*0.32, height:  collectionView.frame.width*0.32)
    }
    
    //for header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photosHeader", for: indexPath) as! PhotosCollectionReusableView
            header.lblHeader.text = arrPhoto[indexPath.section].name
            header.lblHeader.textColor = .white
            header.backgroundColor = .gray
            return header
        }else{
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photosFooter", for: indexPath)
            footer.backgroundColor = UIColor.red
            return footer
        }

    }
    
    //for header height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 5)
    }
    
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

struct Photo{
    var name:String
    var photos:[UIImage]
}
