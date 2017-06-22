//
//  ViewController.swift
//  flowerColorTable
//
//  Created by nhn on 2017/6/16.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    let kSectionCount:Int = 2
    let kRedSection: Int = 0
    let kBlueSection: Int = 1
    let redFlowers: [String] = ["Gerbera","Peony","Rose","Poppy"]
    let blueFlowers: [String] = ["Hyacinth","Hydrangea","Sea Holly","Phlox","Iris"]
    func numberOfSections(in tableView: UITableView) -> Int {
        //返回表视图的分区数
        return kSectionCount
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //返回每个分区的行数
        switch section {
        case kRedSection:
            return redFlowers.count
        case kBlueSection:
            return blueFlowers.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //返回每个分区的标题
        switch section {
        case kRedSection:
            return "Red"
        case kBlueSection:
            return "Blue"
        default:
            return "Unknow"
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //配置要在表视图中显示的单元格
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "flowerCell")! as UITableViewCell
        switch (indexPath.section) {
        case kRedSection:
            cell.textLabel!.text=redFlowers[indexPath.row]
        case kBlueSection:
            cell.textLabel!.text=blueFlowers[indexPath.row]
        default:
            cell.textLabel!.text="Unknown"
        }
        
        let flowerImage: UIImage=UIImage(named: cell.textLabel!.text!)!
        cell.imageView!.image=flowerImage
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //响应单元格选择事件
        var flowerMessage:String
        switch indexPath.section {
        case kRedSection:
            flowerMessage="You Chose the red flower - \(redFlowers[indexPath.row])"
        case kBlueSection:
            flowerMessage = "You chose the blue flower - \(blueFlowers[indexPath.row])"
        default:
            flowerMessage = "I have no idea what you chose!"
        }
        
        let alertController = UIAlertController(title: "Flower Selected",message:flowerMessage,preferredStyle: UIAlertControllerStyle.alert)
        let defaultAction = UIAlertAction(title:"OK",style:UIAlertActionStyle.default,handler:nil)
        alertController.addAction(defaultAction)
        present(alertController,animated: true)
        
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

