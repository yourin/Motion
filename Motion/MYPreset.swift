//
//  MYPreset.swift
//  Motion
//
//  Created by youringtone on 2016/03/31.
//  Copyright © 2016年 youringtone. All rights reserved.
//

import UIKit

class MYPreset {
    
    var presetName:String!
    var myDirectColor:MYDirectColor?
    var date:NSDate!
    var preset =  [String:[String:[String:Double]]]()
    
    init(){
        self.presetName = String(NSDate())
        self.myDirectColor = MYDirectColor()
        self.setDate()
    }
    
    init(name:String,directColor:MYDirectColor){
        self.presetName = name
        self.myDirectColor = directColor
        self.setDate()
    }
    
    func setDate(){
        self.date = NSDate()
    }
    
    func make_Preset(directionColors:MYDirectColor,presetName:String) -> [String:[String:[String:Double]]]{
        let set =
            [presetName:
                [
                    "stop":directionColors.stop.chenge_Dictionary(),
                    "up":directionColors.stop.chenge_Dictionary(),
                    "down":directionColors.stop.chenge_Dictionary(),
                    "left":directionColors.stop.chenge_Dictionary(),
                    "right":directionColors.stop.chenge_Dictionary()
                ]
        ]
        
        self.preset = set
        self.setDate()
        
        return preset
    }
    
    
    func chenge_Dictionary() -> [String:[String:[String:Double]]]{
        
        
        var dic = [String:[String:[String:Double]]]()
        if self.myDirectColor != nil{
         let directColor = self.myDirectColor!
            
        dic =
            [self.presetName:
            [
                "stop":directColor.stop.chenge_Dictionary(),
                "up":directColor.up.chenge_Dictionary(),
                "down":directColor.down.chenge_Dictionary(),
                "left":directColor.left.chenge_Dictionary(),
                "right":directColor.right.chenge_Dictionary()
            ]
        ]
            
        self.setDate()
        }
        return dic
        
    }
    
    
}
