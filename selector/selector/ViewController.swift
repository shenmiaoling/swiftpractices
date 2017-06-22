//
//  ViewController.swift
//  selector
//
//  Created by nhn on 2017/6/13.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func displayAnimal(_ chosenAnimal: String, withSound chosenSound:String, fromComponent chosenComponent: String) {
        outputLabel.text = "You changed \(chosenComponent) (\(chosenAnimal) and the sound \(chosenSound))"
    }

}

