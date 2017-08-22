//
//  MenuBarController.swift
//  BachelorProefAppSwift
//
//  Created by Toon De True on 21/08/2017.
//  Copyright © 2017 Toon De True. All rights reserved.
//

import Foundation
import UIKit

class MenuBarController:UIPageViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let first = orderedViewControllers.first{
            setViewControllers([first], direction: .forward, animated:true, completion:nil)
        }
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.pageController(id: "FirstPage"),
                self.pageController(id: "SecondPage")]
    }()
    
    private func pageController(id: String)-> UIViewController{
        return UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: id)
    }
}

extension MenuBarController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
         let nextIndex = viewControllerIndex + 1
        let orderedViewControllerCount = orderedViewControllers.count
        
        guard orderedViewControllerCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllerCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstView = viewControllers?.first,
            let firstIndex = orderedViewControllers.index(of: firstView) else {
               return 0
        }
        
        return firstIndex
    }
}
