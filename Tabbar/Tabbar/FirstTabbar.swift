//
//  FirstTabbar.swift
//  Tabbar
//
//  Created by nhn on 2017/6/7.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class FirstTabbar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let tabBar = self.tabBarController?.tabBar else { return }
        
        tabBar.tintColor = UIColor.blue
        tabBar.barTintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.brown
        
        
        guard let tabBarItem = self.tabBarItem else { return }
        
        tabBarItem.badgeValue = "123"
        tabBarItem.badgeColor = UIColor.blue
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
