//
//  ViewController.swift
//  Scroller
//
//  Created by nhn on 2017/6/12.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var theScroller: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        theScroller.contentSize=CGSize(width: 300.0,height: 1500.0)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

