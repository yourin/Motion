//
//  ColorChengeView.swift
//  Motion
//
//  Created by youringtone on 2016/04/15.
//  Copyright © 2016年 youringtone. All rights reserved.
//

import UIKit

class ColorChengeView:MYColor {
    var baseView = UIImageView()
    var sw_Red      = UISwitch()
    var sw_green    = UISwitch()
    var sw_blue     = UISwitch()
    var sw_alpha    = UISwitch()
    
//    var uiColor:UIColor!
    
    
    override init(){
        super.init()
        
        let rect = CGRect(origin: CGPointZero, size: CGSize(width: 200, height: 200))
        baseView = UIImageView(frame: rect)
        baseView.backgroundColor = UIColor.lightGrayColor()
        baseView.userInteractionEnabled = true
        
        let ary_SW = [sw_Red,sw_green,sw_blue,sw_alpha]
        
        var i = 0
        for sw in ary_SW {
            sw.on = true
            sw.center = CGPoint(x: sw.frame.midX, y: sw.frame.midY + (sw.frame.maxY * CGFloat(i) + 10))
            baseView.addSubview(sw)
            i += 1
        }
        
        
        
//        sw_Red.on = true
//        sw_green.on = true
//        sw_blue.on = true
//        sw_alpha.on = true
//        
//        baseView.addSubview(sw_Red)
//        baseView.addSubview(sw_green)
//        baseView.addSubview(sw_blue)
//        baseView.addSubview(sw_alpha)
        
        
    }

    
    
    
}
