//
//  ViewController.swift
//  FlowerWeb
//
//  Created by nhn on 2017/6/10.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        flowerDetailView.isHidden = true
        blurView.isHidden = true
        getFlower(nil)
    }

    @IBOutlet weak var colorChoice: UISegmentedControl!
    @IBOutlet weak var flowerView: UIWebView!
    @IBOutlet weak var flowerDetailView: UIWebView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBAction func toggleFlowerDetail(_ sender: Any) {
        flowerDetailView.isHidden = !(sender as!UISwitch).isOn
        blurView.isHidden = !(sender as! UISwitch).isOn
    }
    
    @IBAction func getFlower(_ sender: Any?) {
        var imageURL: URL
        var detailURL: URL
        var imageURLString: String
        var detailURLString: String
        var color: String
        let sessionID = Int(arc4random_uniform(50000))
        color = colorChoice.titleForSegment(at: colorChoice.selectedSegmentIndex)!
        
        imageURLString = "https://teachyourselfios.info/?hour=9&color=\(color)&session=\(sessionID)"
        detailURLString = "https://teachyourselfios.info/?hour=9&session=\(sessionID)&type=detail"
        imageURL=URL(string: imageURLString)!
        detailURL=URL(string: detailURLString)!
        
        flowerView.loadRequest(URLRequest(url: imageURL))
        flowerDetailView.loadRequest(URLRequest(url: detailURL))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

