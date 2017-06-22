//
//  ViewController.swift
//  alert&sound
//
//  Created by nhn on 2017/6/12.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    @IBOutlet weak var userOutput: UILabel!
    @IBAction func doAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "标题",message: "副标题",preferredStyle: UIAlertControllerStyle.alert)
        let defaultAction = UIAlertAction(title: "OK",style: UIAlertActionStyle.cancel,handler:nil)
        alertController.addAction(defaultAction)
        present(alertController,animated: true)

    }
    @IBAction func doMultiBottonAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "title", message:"one message!",preferredStyle: UIAlertControllerStyle.alert)
        let nowAction = UIAlertAction(title: "Do Something Now!",style: UIAlertActionStyle.default,handler: {(alertAction: UIAlertAction) in self.userOutput.text = "Press Now"})
        let laterAction = UIAlertAction(title:"Do Something Later!",style:UIAlertActionStyle.default,handler:{(alertAction: UIAlertAction) in self.userOutput.text = "Press Later"})
        let cancelAction = UIAlertAction(title:"Never Do It!",style:UIAlertActionStyle.cancel,handler:{(alertAction: UIAlertAction) in self.userOutput.text = "Press Never"})
        alertController.addAction(nowAction)
        alertController.addAction(laterAction)
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true)
    }
    @IBAction func doAlertInput(_ sender: Any) {
        let alertController = UIAlertController(title:"Emial Address",message:"Please enter your email address below",preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addTextField(configurationHandler: {(textFiled: UITextField) in
            textFiled.placeholder = "Email Address"
            textFiled.keyboardType = UIKeyboardType.emailAddress
            textFiled.isSecureTextEntry = true
        })
        let defaultAction = UIAlertAction(title:"OK",style:UIAlertActionStyle.default,handler:{(alertAction: UIAlertAction) in
            //获取输入框内容
            let emailAddress: String = alertController.textFields![0].text!
            self.userOutput.text = "Entered '\(emailAddress)'"
        })
        alertController.addAction(defaultAction)
        present(alertController,animated: true)
    }
    @IBAction func doActionSheet(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Available Actions",message: "Choose something from this list",preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let negotiateAction = UIAlertAction(title:"Negotiate",style: UIAlertActionStyle.default,handler:{(alertAction: UIAlertAction) in self.userOutput.text = "press negotiate"})
        let compromiseAction = UIAlertAction(title:"Compromise",style: UIAlertActionStyle.default,handler:{(aleretAction: UIAlertAction) in self.userOutput.text = "press compromise"})
        let destroyAction = UIAlertAction(title:"Destroy",style:UIAlertActionStyle.destructive,handler:{(alertAction:UIAlertAction) in self.userOutput.text = "press destroy"})
        let cancelAction = UIAlertAction(title:"cancel",style: UIAlertActionStyle.cancel,handler:{(alertAction: UIAlertAction) in self.userOutput.text = "press cancel"})
        
        alertController.addAction(negotiateAction)
        alertController.addAction(compromiseAction)
        alertController.addAction(destroyAction)
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true)
        
    }
    @IBAction func doSound(_ sender: Any) {
        var soundID: SystemSoundID = 0
        let soundFile: String = Bundle.main.path(forResource: "soundeffect", ofType: "wav")!
        let soundURL : URL = URL(fileURLWithPath: soundFile)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    @IBAction func doAlertSound(_ sender: Any) {
        var soundID: SystemSoundID = 0
        let soundFile: String = Bundle.main.path(forResource:"alertsound",ofType:"wav")!
        let soundURL: URL = URL(fileURLWithPath: soundFile)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        AudioServicesPlayAlertSound(soundID)
    }
    @IBAction func doVibration(_ sender: Any) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
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

