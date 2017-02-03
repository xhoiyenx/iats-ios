//
//  IntroContentViewController.swift
//  iats
//
//  Created by ITConcept on 29/1/17.
//  Copyright © 2017 IATS. All rights reserved.
//

import UIKit

class IntroContentViewController: UIViewController {
	
	var index = 0
	var header = ""

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var pageControl: UIPageControl!
	@IBOutlet weak var nextButton: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		titleLabel.text = header
		pageControl.currentPage = index
		
		switch index {
		case 2:
			nextButton.setTitle("Done", for: .normal)
		default:
			nextButton.setTitle("Next", for: .normal)
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func next(sender: UIButton) {
		switch index {
		case 2:
			let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Terms")
			present(viewController, animated: false, completion: nil)
			break
			//present(TncViewController, animated: true, completion: nil)
		default:
			let pageViewController = parent as! IntroViewController
			pageViewController.forward(index: index)
			break
		}
	}
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
