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
        
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page1")
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "page2")
        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "page3")
        
        arrContainers.append(vc1!)
        arrContainers.append(vc2!)
        arrContainers.append(vc3!)
        
        delegate = self
        dataSource = self
        
        if let FirstVC = arrContainers.first{
            setViewControllers([FirstVC], direction: .forward, animated: true, completion: nil)
        }
        
        addPageControl()
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = arrContainers.firstIndex(of: viewController) else{
            return nil
        }
        
        let previousIndex = currentIndex-1
        guard  previousIndex >= 0 else{
            return nil
        }
        
        return arrContainers[previousIndex]
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = arrContainers.firstIndex(of: viewController) else{
            return nil
        }
        let nextIndex = currentIndex+1
        guard nextIndex < arrContainers.count else{
            return nil
        }
        return arrContainers[nextIndex]
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
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.white
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    
    
    // this func will be called if action happend in page view controller
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        self.pageControl.currentPage = arrContainers.firstIndex(of: pageViewController.viewControllers![0])!
    }
    
    
}
