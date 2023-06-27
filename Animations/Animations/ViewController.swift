//
//  ViewController.swift
//  Animations
//
//  Created by Mohamed Elkomey on 26/06/2023.
//

import UIKit

//3ed party librarys for animation (hero / lottie-ios)

class ViewController: UIViewController {
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var imgHeart: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        card1.alpha = 0
        card2.alpha = 0
        card3.alpha = 0
        card4.alpha = 0
        
    }
    override func viewDidAppear(_ animated: Bool) {
        animateItems()
    }
    
    func animateItems(){
        UIView.animate(withDuration: 1.5) {
            self.card1.alpha = 1
            self.card2.alpha = 1
            self.card3.alpha = 1
            self.card4.alpha = 1
        }
        
        UIView.animate(withDuration: 1.5) {
            self.card1.center.y += 50
            self.card2.center.y += 50
            self.card3.center.y += 50
            self.card4.center.y += 50
        } completion: { completed in
            if completed {
                self.animateButtons()
            }
        }
        
        UIView.animate(withDuration: 1, delay: 2, options: [.repeat , .autoreverse],
    animations:{
          //  self.imgHeart.alpha = 0
            self.imgHeart.frame = CGRect(x: self.imgHeart.frame.minX - 25, y: self.imgHeart.frame.minY - 25, width: self.imgHeart.frame.width + 50, height: self.imgHeart.frame.height + 50)
        }, completion: nil)


    }
    
    func animateButtons(){
        UIView.animate(withDuration: 0.5) {
            self.card1.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1)
        } completion: { completed in
            if completed{
                UIView.animate(withDuration: 0.4) {
                    self.card1.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }
            }
        }
        
        UIView.animate(withDuration: 0.4) {
            self.card2.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1)
        } completion: { completed in
            if completed{
                UIView.animate(withDuration: 0.4) {
                    self.card2.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.card3.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1)
        } completion: { completed in
            if completed{
                UIView.animate(withDuration: 0.3) {
                    self.card3.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }
            }
        }
        
        UIView.animate(withDuration: 0.45) {
            self.card4.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1)
        } completion: { completed in
            if completed{
                UIView.animate(withDuration: 0.45) {
                    self.card4.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }
            }
        }
       

    }

    @IBAction func btnFirstCard(_ sender: Any) {
        animateButtons()
    }
    
}


