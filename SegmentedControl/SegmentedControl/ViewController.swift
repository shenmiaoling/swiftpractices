//
//  ViewController.swift
//  SegmentedControl
//
//  Created by nhn on 2017/6/3.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textLabel.text = "First Segment Selected";
        case 1:
            textLabel.text = "Seconed Segment Selected";
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

