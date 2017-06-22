//
//  ViewController.swift
//  returnMe
//
//  Created by nhn on 2017/6/19.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let kName:String = "name"
    let kEmail:String = "email"
    let kPhone:String = "phone"
    let kPicture:String = "picture"

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    func setValuesFromPreferences() {
        let userDefaults:UserDefaults = UserDefaults.standard
        let initialDefaults:[String:String] = [kPicture : "Dog",
                                               kName:"Your Name",
                                               kEmail:"you@yours.com",
                                               kPhone:"(555)555-1212"]
        userDefaults.register(defaults: initialDefaults)
        
        let picturePreference:String=userDefaults.string(forKey: kPicture)!
        if picturePreference=="Dog" {
            picture.image=UIImage(named:"dog1.png")
        }else if picturePreference=="Crazy Dog"{
            picture.image=UIImage(named:"dog2.png")
        }else{
            picture.image=UIImage(named:"coral.png")
        }
        name.text = userDefaults.string(forKey: kName)
        email.text = userDefaults.string(forKey: kEmail)
        phone.text = userDefaults.string(forKey: kPhone)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setValuesFromPreferences()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

