//
//  PageViewController.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 21/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//


import UIKit
import Foundation

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var index = 0
    var identifiers = ["HighRiskInvestmentVC", "LowRiskInvestmentVC", "PropertiesVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        let startingViewController = self.viewControllerAtIndex(self.index)
        let viewControllers: NSArray = [startingViewController]
        self.setViewControllers(viewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewControllerAtIndex(index: Int) -> UIViewController! {
        
        //first view controller = firstViewControllers navigation controller
        if index == 0 {
            
            return HighRiskInvestmentsVC() //self.storyboard!.instantiateViewControllerWithIdentifier("HRI")
            
        }
        
        //second view controller = secondViewController's navigation controller
        if index == 1 {
            
            return LowRiskInvestmentsVC() //self.storyboard!.instantiateViewControllerWithIdentifier("LRI")
        }
        
        
        if (index == 2){
        
            return PropertiesVC()
        }
        
        return nil
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let identifier = viewController.restorationIdentifier
        let index = self.identifiers.indexOf(identifier!)
        
        if (index == 0){
            return LowRiskInvestmentsVC()
        }
        
        if (index == 1){
            return PropertiesVC()
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let identifier = viewController.restorationIdentifier
        let index = self.identifiers.indexOf(identifier!)
        
        if (index == 2){
        return LowRiskInvestmentsVC()
        }
        
        if (index == 1){
        return HighRiskInvestmentsVC()
        }
        
    return nil
        
    }
    
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.identifiers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
}
