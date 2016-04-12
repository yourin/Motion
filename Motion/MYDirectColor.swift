//
//  MYDirectColor.swift
//  Motion
//
//  Created by youringtone on 2016/03/30.
//  Copyright © 2016年 youringtone. All rights reserved.
//

import UIKit

class MYDirectColor {
    
    var tag:Int!
    var name:String!
    var stop:MYColor!
    var up  :MYColor!
    var down:MYColor!
    var left:MYColor!
    var right:MYColor!
    
    
    init(){
        self.stop   = MYColor()
        self.up     = MYColor()
        self.down   = MYColor()
        self.left   = MYColor()
        self.right  = MYColor()
        self.name = ""
        self.tag = 0
    }
    
//    class func chenge_Dictionary() ->[String:[String:Double]]{
//        var dic = [String:[String:Double]]()
//        
//        dic =
//            [
//                "stop"  :[]//self.stop.chenge_Dictionary(),
//                "up"    :self.up.chenge_Dictionary(),
//                "down"  :self.down.chenge_Dictionary(),
//                "left"  :self.left.chenge_Dictionary(),
//                "right" :self.right.chenge_Dictionary()
//        ]
//        
//        return dic
//        
//    }

    
    func chenge_Dictionary() ->[String:[String:Double]]{
        var dic = [String:[String:Double]]()

        dic =
            [
            "stop"  :self.stop.chenge_Dictionary(),
            "up"    :self.up.chenge_Dictionary(),
            "down"  :self.down.chenge_Dictionary(),
            "left"  :self.left.chenge_Dictionary(),
            "right" :self.right.chenge_Dictionary()
        ]
        
        return dic

    }
    
    func chenge_StopColor(color:MYColor){
        self.stop = color
    }
    
    func chenge_UpColor(color:MYColor){
        self.up = color
    }
    func chenge_DownColor(color:MYColor){
        self.down = color
    }
    func chenge_LeftColor(color:MYColor){
        self.left = color
    }
    func chenge_RightColor(color:MYColor){
        self.right = color
    }

    
    
}
