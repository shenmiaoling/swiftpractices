//
//  ViewController.swift
//  draggingView
//
//  Created by nhn on 2017/6/6.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //选中某个视图后，这个视图会出现在其他视图的前面，其中心位置的坐标值就是lastlocation 变量值。现在，自定义的视图差不多完成了，移植到视图控制器 (view controller) 上吧。在 ViewController.swift文件中实现 viewDidLoad方法
    //有 25 个 50x50 大小的视图随机地出现在主界面上，运行工程，点击并拖动一个视图，这个视图会一直在其他视图上面。
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let halfSizeOfView = 25.0
        let maxViews = 25
        let insetSize = self.view.bounds.insetBy(dx: CGFloat(Int(2 * halfSizeOfView)), dy: CGFloat(Int(2 * halfSizeOfView))).size
        
        for _ in 0..<maxViews {
            let pointX = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.width))))
            let pointY = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.height))))
            let newView = MyView(frame: CGRect(x: pointX, y: pointY, width:50, height:50))
            self.view.addSubview(newView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

