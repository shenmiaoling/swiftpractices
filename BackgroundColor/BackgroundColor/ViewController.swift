//
//  ViewController.swift
//  BackgroundColor
//
//  Created by nhn on 2017/6/17.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var hueSlider: UISlider!
    @IBOutlet weak var SliderValue: UILabel!
    let kOnOffToggle="onOff"
    let kHueSetting="hue"
    @IBAction func setBackgroundHueValue(_ sender: Any?) {
        
        let userDefaults: UserDefaults = UserDefaults.standard
        userDefaults.set(toggleSwitch.isOn,forKey: kOnOffToggle)
        userDefaults.set(hueSlider.value, forKey: kHueSetting)
        userDefaults.synchronize()

        SliderValue.text = String(format:"sider value: %.1f",hueSlider.value)
        if toggleSwitch.isOn {
            view.backgroundColor = UIColor(hue: CGFloat(hueSlider.value),saturation:0.75,brightness:0.75,alpha:1.0)
        }else{
            view.backgroundColor=UIColor.white
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefault: UserDefaults = UserDefaults.standard
        hueSlider.value = userDefault.float(forKey:kHueSetting)
        toggleSwitch.isOn=userDefault.bool(forKey:kOnOffToggle)
        SliderValue.text = String(userDefault.float(forKey:kHueSetting))
        setBackgroundHueValue(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

