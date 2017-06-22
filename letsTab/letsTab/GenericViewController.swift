//
//  GenericViewController.swift
//  letsTab
//
//  Created by nhn on 2017/6/14.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var barItem: UITabBarItem!
    @IBAction func incrementCountFirst(_ sender: Any) {
        (parent as! CountingTabBarController).firstCount+=1
        updateBadge()
        updateCounts()
    }
    @IBAction func incrementCountSecond(_ sender: Any) {
        (parent as! CountingTabBarController).secondCount+=1
        updateCounts()
        updateBadge()
    }
    @IBAction func incrementCountThird(_ sender: Any) {
        (parent as! CountingTabBarController).thirdCount+=1
        updateBadge()
        updateCounts()
    }
    func updateCounts() {
        let first = (parent as! CountingTabBarController).firstCount
        let second = (parent as! CountingTabBarController).secondCount
        let third = (parent as! CountingTabBarController).thirdCount
        self.countLabel.text = "First: \(first)\nSecond:\(second)\nThird:\(third)"
    }
    func updateBadge() {
        var badgeCount: Int
        if (barItem.badgeValue != nil) {
            badgeCount = Int(barItem.badgeValue!)!
            badgeCount += 1
            barItem.badgeValue = String(badgeCount)
        }else {
            barItem.badgeValue = "1"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
