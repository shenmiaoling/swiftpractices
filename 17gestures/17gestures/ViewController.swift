//
//  ViewController.swift
//  17gestures
//
//  Created by nhn on 2017/6/21.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var originalRect: CGRect!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBAction func foundTap(_ sender: Any) {
        outputLabel.text = "Tapped"
    }
    @IBAction func foundSwipe(_ sender: Any) {
        outputLabel.text = "Swipe"
    }
    @IBAction func foundPinch(_ sender: Any) {
        var recognizer:UIPinchGestureRecognizer
        var feedback: String
        var scale:CGFloat
        
        recognizer = sender as! UIPinchGestureRecognizer
        scale = recognizer.scale
//        imageView.transform = CGAffineTransform(rotationAngle: 0.0)
        feedback=String(format: "Pinched, Scale: %1.2f, Velocity: %1.2f", Float(recognizer.scale),Float(recognizer.velocity))
        outputLabel.text = feedback
        imageView.frame = CGRect(x: originalRect.origin.x, y: originalRect.origin.y, width: originalRect.size.width*scale, height: originalRect.size.height*scale)
    }
    @IBAction func foundzRotation(_ sender: Any) {
        var recognizer: UIRotationGestureRecognizer
        var feedback: String
        var rotation: CGFloat
        recognizer = sender as! UIRotationGestureRecognizer
        rotation = recognizer.rotation
        
        feedback = String(format: "Rotated,Redians:%1.2f,Velocity:%1.2f",Float(recognizer.rotation),Float(recognizer.velocity))
        outputLabel.text = feedback
        imageView.transform = CGAffineTransform(rotationAngle: rotation)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalRect = imageView.frame;
        var tempImageView: UIImageView
        tempImageView=UIImageView(image:UIImage(named:"flower.png"))
        tempImageView.frame = originalRect
        view.addSubview(tempImageView)
        self.imageView = tempImageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

