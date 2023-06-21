//
//  PageOnboardingViewController.swift
//  Page View Controller
//
//  Created by Mohamed Elkomey on 20/06/2023.
//

import UIKit

class PageOnboardingViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{

    var arrContainers = [UIViewController]()
    var pageControl :UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        //for indicator background color ,if your all pages has the same background color
        //view.backgroundColor = UIColor.red
        
        //by multible view controllers
//        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page1")
//        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "page2")
//        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "page3")

        //by only one view controller
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        vc1.titleText = "FirstUI"
        vc1.descreptionText = "First discreption"
        vc1.bgColor = UIColor.red
        
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        vc2.titleText = "SecondUI"
        vc2.descreptionText = "Second discreption"
        vc2.bgColor = UIColor.magenta
        
        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        vc3.titleText = "ThirdUI"
        vc3.descreptionText = "Third discreption"
        vc3.bgColor = UIColor.cyan
        
                arrContainers.append(vc1)
                arrContainers.append(vc2)
                arrContainers.append(vc3)
        
        delegate = self
        dataSource = self
        
        if let FirstVC = arrContainers.first{
            setViewControllers([FirstVC], direction: .forward, animated: true, completion: nil)
        }
        
        addPageControl()
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //LTR
//        guard let currentIndex = arrContainers.firstIndex(of: viewController) else{
//            return nil
//        }
//
//        let previousIndex = currentIndex-1
//        guard  previousIndex >= 0 else{
//            return nil
//        }
//
//        return arrContainers[previousIndex]
        
        //RTL
        guard let currentIndex = arrContainers.firstIndex(of: viewController) else{
            return nil
        }
        let nextIndex = currentIndex+1
        guard nextIndex < arrContainers.count else{
            return nil
        }
        return arrContainers[nextIndex]
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //LTR
//        guard let currentIndex = arrContainers.firstIndex(of: viewController) else{
//            return nil
//        }
//        let nextIndex = currentIndex+1
//        guard nextIndex < arrContainers.count else{
//            return nil
//        }
//        return arrContainers[nextIndex]
        
        //RTL
        guard let currentIndex = arrContainers.firstIndex(of: viewController) else{
            return nil
        }

        let previousIndex = currentIndex-1
        guard  previousIndex >= 0 else{
            return nil
        }

        return arrContainers[previousIndex]
        
//        if let currentIndex = arrContainers.firstIndex(of: viewController) {
//            if currentIndex < arrContainers.count-1{
//                return arrContainers[currentIndex+1]
//            }
//        }
//
//        return nil
//    }
    }
    
    

//    //for indicator .o.. if your all pages has the same background color
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return arrContainers.count
//    }
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
    //indicator by another way to make it with background custom using page control
    func addPageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 75, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = arrContainers.count
        self.pageControl.currentPage = arrContainers.count - 1
        self.pageControl.tintColor = UIColor.white
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    
    
    // this func will be called if action happend in page view controller
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        //LTR
       // self.pageControl.currentPage = arrContainers.firstIndex(of: pageViewController.viewControllers![0])!
        //RTL
        self.pageControl.currentPage = (arrContainers.count-1)-(arrContainers.firstIndex(of: pageViewController.viewControllers![0])!)
    }
    
    
}
