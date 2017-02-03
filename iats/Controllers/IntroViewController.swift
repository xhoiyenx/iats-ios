//
//  IntroViewController.swift
//  iats
//
//  Created by ITConcept on 29/1/17.
//  Copyright © 2017 IATS. All rights reserved.
//

import UIKit

class IntroViewController: UIPageViewController, UIPageViewControllerDataSource {
	
	var titleHeaders = [
		"Title One",
		"Title Two",
		"Title Tri"
	]
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		dataSource = self
		
		if let startingViewController = contentViewController(at: 0) {
			setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	private func newContentController(name: String) -> UIViewController {
		return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
	}
	
	func forward(index: Int) {
		if let nextViewController = contentViewController(at: index + 1) {
			setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
		}
	}
	
	func contentViewController(at index: Int) -> IntroContentViewController? {
		if index < 0 || index >= titleHeaders.count {
			return nil
		}
		
		if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentIntro") as? IntroContentViewController {
			pageContentViewController.index = index
			pageContentViewController.header = titleHeaders[index]
			return pageContentViewController
		}
		
		return nil
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		var index = (viewController as! IntroContentViewController).index
		index -= 1
		
		return contentViewController(at: index)
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		var index = (viewController as! IntroContentViewController).index
		index += 1
		
		return contentViewController(at: index)
	}

}
