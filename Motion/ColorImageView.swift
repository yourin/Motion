//
//  ColorImageView.swift
//  Motion
//
//  Created by youringtone on 2016/04/05.
//  Copyright © 2016年 youringtone. All rights reserved.
//

import UIKit

class ColorImageView {
    
    var tag:Int = 0
    
    var name = ""
    
    var baseView:UIView!
    var up:UIImageView! = UIImageView()
    var down:UIImageView! = UIImageView()
    var left:UIImageView! = UIImageView()
    var right:UIImageView! = UIImageView()
    var stop:UIImageView! = UIImageView()
    
//    var upButton:UIButton! = UIButton()
//    var downButton:UIButton! = UIButton()
//    var stopButton:UIButton! = UIButton()
//    var leftButton:UIButton! = UIButton()
//    var rightButton:UIButton! = UIButton()
//    
    
    init(){
        
        self.baseView = UIView(frame:CGRect(origin: CGPointZero,
            size: CGSize(width: 160, height: 240)))
        self.baseView.userInteractionEnabled = true
        
        let square = CGRect(origin: CGPointZero,
            size: CGSize(width: 70, height: 75))
        
        let longSquare = CGRect(origin: CGPointZero,
        size: CGSize(width: 40, height: 240))
        
        
        self.up = UIImageView(frame:square)
//        self.upButton = UIButton(frame: square)
//        self.upButton.center = self.up.center
//        self.upButton.addTarget(self, action: Selector("actionButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.stop = UIImageView(frame:square)
//        self.stopButton = UIButton(frame: square)
        
        
        self.down = UIImageView(frame:square)
//        self.downButton = UIButton(frame: square)
        self.left = UIImageView(frame: longSquare)
//        self.leftButton = UIButton(frame: longSquare)
        self.right = UIImageView(frame: longSquare)
//        self.rightButton = UIButton(frame: longSquare)
        
        self.up.center = CGPoint(x:80 , y: 37.5)
        self.stop.center = self.baseView.center
        self.down.center = CGPoint(x:80 , y: 202.5)
        self.left.center = CGPoint(x: 20, y: 120)
        self.right.center = CGPoint(x: 140, y: 120)
        
        
        self.up.backgroundColor = UIColor.greenColor()
        self.stop.backgroundColor = UIColor.grayColor()
        self.down.backgroundColor = UIColor.yellowColor()
        self.left.backgroundColor = UIColor.redColor()
        self.right.backgroundColor = UIColor.blueColor()
        
        self.baseView.addSubview(self.up)
//        self.up.addSubview(upButton)
        self.baseView.addSubview(self.down)
        self.baseView.addSubview(self.stop)
        self.baseView.addSubview(self.left)
        self.baseView.addSubview(self.right)
        
    }
    
    init(upColor:UIColor,downColor:UIColor,stopColor:UIColor,leftColor:UIColor,rightColor:UIColor){
        
        self.baseView = UIView(frame:CGRect(origin: CGPointZero,
            size: CGSize(width: 160, height: 240)))
        self.baseView.userInteractionEnabled = true
        
        let square = CGRect(origin: CGPointZero,
            size: CGSize(width: 70, height: 75))
        
        let longSquare = CGRect(origin: CGPointZero,
            size: CGSize(width: 40, height: 240))
        
        
        
        self.up = UIImageView(frame:square)
        self.stop = UIImageView(frame:square)
        self.down = UIImageView(frame:square)
        self.left = UIImageView(frame:longSquare)
        self.right = UIImageView(frame:longSquare)
        
        self.up.center = CGPoint(x:80 , y: 37.5)
        self.stop.center = self.baseView.center
        self.down.center = CGPoint(x:80 , y: 202.5)
        self.left.center = CGPoint(x: 20, y: 120)
        self.right.center = CGPoint(x: 140, y: 120)
        
        
        self.up.backgroundColor = upColor// UIColor.greenColor()
        self.stop.backgroundColor = stopColor // UIColor.grayColor()
        self.down.backgroundColor = downColor // UIColor.yellowColor()
        self.left.backgroundColor = leftColor// UIColor.redColor()
        self.right.backgroundColor = rightColor// UIColor.blueColor()
        
        self.baseView.addSubview(self.up)
        self.baseView.addSubview(self.down)
        self.baseView.addSubview(self.stop)
        self.baseView.addSubview(self.left)
        self.baseView.addSubview(self.right)
        
    }
    
    init(color:UIColor){
        self.baseView = UIView(frame:CGRect(origin: CGPointZero,
            size: CGSize(width: 80, height: 120)))
        self.baseView.userInteractionEnabled = true
        
        let square = CGRect(origin: CGPointZero,
            size: CGSize(width: 36, height: 36))
        
        let longSquare = CGRect(origin: CGPointZero,
            size: CGSize(width: 20, height: 120))
        
        
        
        self.up = UIImageView(frame:square)
        self.stop = UIImageView(frame:square)
        self.down = UIImageView(frame:square)
        self.left = UIImageView(frame:longSquare)
        self.right = UIImageView(frame:longSquare)
        
        self.up.center = CGPoint(x: 40 , y: 18)
        self.stop.center = self.baseView.center
        self.down.center = CGPoint(x: 40 , y: 120 - 18)
        
        self.left.center = CGPoint(x: 10, y: 60)
        self.right.center = CGPoint(x: 70, y: 60)
        
        
        self.up.backgroundColor = color// UIColor.greenColor()
        self.stop.backgroundColor = color // UIColor.grayColor()
        self.down.backgroundColor = color // UIColor.yellowColor()
        self.left.backgroundColor = color// UIColor.redColor()
        self.right.backgroundColor = color// UIColor.blueColor()
        
        self.baseView.addSubview(self.up)
        self.baseView.addSubview(self.down)
        self.baseView.addSubview(self.stop)
        self.baseView.addSubview(self.left)
        self.baseView.addSubview(self.right)
        
    }

    func actionButton(){
        print(#function)
    }
    
}
