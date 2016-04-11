//
//  MYColor.swift
//  Motion
//
//  Created by youringtone on 2016/03/29.
//  Copyright © 2016年 youringtone. All rights reserved.
//


import UIKit

class MYColor {
    var red:Double!
    var green:Double!
    var blue:Double!
    var alpha:Double!
    
    init(){
        self.red = 1.0
        self.green = 1.0
        self.blue = 1.0
        self.alpha = 1.0

        
    }
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
//        super.init(red: red, green: green, blue: blue, alpha: alpha)
        self.red = Double(red)
        self.green = Double(green)
        self.blue = Double(blue)
        self.alpha = Double(alpha)
    }
    
    init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red = Double(red)
        self.green = Double(green)
        self.blue = Double(blue)
        self.alpha = Double(alpha)
    }
    
    func chenge_UIColor() -> UIColor{
        
        let red = CGFloat(self.red)
        let green = CGFloat(self.green)
        let blue = CGFloat(self.blue)
        let alpha = CGFloat(self.alpha)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
    }
    
    func chenge_Dictionary() -> [String:Double]{
        var dic = [:]
        
        
        dic = [
            "red":self.red,
            "green":self.green,
            "blue":self.blue,
            "alpha":self.alpha
        ]
        return dic as! [String : Double]
    }
    
    func set_BlackColor(){
        self.red = 0.0
        self.green = 0.0
        self.blue = 0.0
        self.alpha = 0.0
        
    }
    
    func set_WhiteColor(){
        self.red = 1.0
        self.green = 1.0
        self.blue = 1.0
        self.alpha = 1.0
    }
    
    func set_RedColor(){
        self.red = 1.0
        self.green = 0.0
        self.blue = 0.0
        self.alpha = 1.0
    }

}
