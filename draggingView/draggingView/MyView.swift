//
//  MyView.swift
//  draggingView
//
//  Created by nhn on 2017/6/6.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class MyView: UIView {
    //记录用户触摸点的最后位置
    var lastLocation = CGPoint(x: 0,y: 0)
    //子类重写父类的 init 方法，当子类的初始化方法参数类型与父类初始化方法参数类型不同是就不必加 override 修饰符了
    //首先给视图添加一个拖曳手势识别器 (pan gesture recognizer)，这样就可以点击选中并拖拽视图到新的位置。接下来创建随机颜色，以作为视图的背景色。
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let panRecognizer = UIPanGestureRecognizer(target:self,action:#selector(MyView.detectPan(_:)))
        self.gestureRecognizers = [panRecognizer]
        
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
        self.backgroundColor = UIColor(red: redValue, green: greenValue,blue: blueValue, alpha: 1.0)
    }
    //在swift 中继承 UIView 的子类时候，会要求写 required init 这个方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //这样在每次识别到手势后，都会调用 detectPan 方法
    func detectPan(_ recognizer:UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: self.superview)
        print(self.superview)
    self.center = CGPoint(x: lastLocation.x + translation.x, y:lastLocation.y + translation.y)
    }
    //translation 变量检测到新的坐标值之后，视图的中心将根据改变后的坐标值做出相应调整。当用户点击视图时，调用 touchesBegan:event方法，下面就来实现此方法。
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 把当前被选中的视图放到前面
        self.superview?.bringSubview(toFront: self)
         // 记住原来的位置
        lastLocation = self.center
    }

}
