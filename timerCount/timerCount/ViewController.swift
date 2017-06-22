//
//  ViewController.swift
//  timerCount
//
//  Created by nhn on 2017/6/7.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var ParseButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    @IBAction func startTimer(_ sender: Any) {
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        ParseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    @IBAction func ParseTimer(_ sender: Any) {
        startButton.isEnabled = true
        ParseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    @IBAction func ResetButton(_ sender: Any) {
        startButton.isEnabled = true
        ParseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
    }
    func UpdateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f",counter)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counter)
        ParseButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

