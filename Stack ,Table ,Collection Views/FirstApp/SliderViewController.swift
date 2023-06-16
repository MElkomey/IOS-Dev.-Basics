//
//  SliderViewController.swift
//  FirstApp
//
//  Created by Mohamed Elkomey on 15/06/2023.
//

import UIKit

class SliderViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {

    var arrPlants = [UIImage(named: "img_plant1"),UIImage(named: "img_plant2"),UIImage(named: "img_plant1"),UIImage(named: "img_plant2"),UIImage(named: "img_plant1"),UIImage(named: "img_plant1")]
    
    var timer:Timer?
    var currentIndex = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        //paging enabled in attributes , estimating size ->none
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        pageControl.numberOfPages = arrPlants.count
        startTimer()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(goNext), userInfo: nil, repeats: true)
    }
    
    @objc func goNext(){
        currentIndex = (currentIndex + 1) % arrPlants.count
        pageControl.currentPage = currentIndex
        collectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        print (currentIndex)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return arrPlants.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! SliderCollectionViewCell
        cell.imageView.image = arrPlants[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
