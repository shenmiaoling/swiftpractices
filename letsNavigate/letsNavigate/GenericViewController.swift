//
//  GenericViewController.swift
//  letsNavigate
//
//  Created by nhn on 2017/6/14.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBAction func incrementCount(_ sender: Any) {
        (parent as! CountingNavigationControllerViewController).pushCount += 1
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let displayCount = (parent as! CountingNavigationControllerViewController).pushCount
        countLabel.text = String(displayCount)
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
