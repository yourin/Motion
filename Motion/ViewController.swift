//
//  ViewController.swift
//  Motion
//
//  Created by youringtone on 2016/03/18.
//  Copyright © 2016年 youringtone. All rights reserved.
//

import UIKit

enum Direction {
    case Stop,Up,Down,Left,Right
}

enum Colors {
    case Red,Green,Blue,Alpha
}

let _ud = NSUserDefaults.standardUserDefaults()

var _aryPresetName = ["0","1","2","3","4","5"]
var _CIView = ColorImageView()
class ViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var segmentPresets: UISegmentedControl!
    
    @IBOutlet weak var iv_Up: UIImageView!
    @IBOutlet weak var iv_Stop: UIImageView!
    @IBOutlet weak var iv_Down: UIImageView!
    @IBOutlet weak var iv_Left: UIImageView!
    @IBOutlet weak var iv_Right: UIImageView!
    @IBOutlet weak var tf_segmentNames: UITextField!
    
    var _segmentPresetsIndexNow:Int! = 0
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Delegateを設定する.
        tf_segmentNames.delegate = self
        
        let _colorImageView = ColorImageView.init(color: UIColor.grayColor())
        
        let baseSize = _colorImageView.baseView.frame.size
        print(baseSize)
        
        _colorImageView.baseView.center = self.view.center
        
        self.view.addSubview(_colorImageView.baseView)
        
        _colorImageView.down.backgroundColor = UIColor.orangeColor()
        
        let redColor = MYColor()
        redColor.set_RedColor()
        
        let directColor = MYDirectColor()
        
        directColor.chenge_LeftColor(redColor)
        directColor.chenge_RightColor(redColor)
        
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "0")
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "1")
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "2")
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "3")
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "4")
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "5")
        
       _CIView = _colorImageView
    }
    
    func iv_SetColor(){
        let w = UIColor.whiteColor()
        let r = UIColor.redColor()
        let b = UIColor.blueColor()
        let g = UIColor.greenColor()
        
        self.iv_Up.backgroundColor = g
        self.iv_Stop.backgroundColor = UIColor.blackColor()
        self.iv_Down.backgroundColor = w
        self.iv_Left.backgroundColor = r
        self.iv_Right.backgroundColor = b
        
    }
    
    func save_Presets(name:String,directColor:MYDirectColor){
        
        _ud.setObject(directColor.chenge_Dictionary(), forKey: name)

    }
    
    func load_Preset(name:String) -> MYDirectColor?{
        
        var dic:MYDirectColor? = nil
        
        if let directColor = _ud.objectForKey(name) {
            dic =   directColor as? MYDirectColor
        }
        return dic
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionSegmentPresets(sender: UISegmentedControl) {
        
        print(__FUNCTION__)

        print("segment = \(sender.selectedSegmentIndex)")
        _segmentPresetsIndexNow = sender.selectedSegmentIndex
        
        tf_segmentNames.text = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)!
        
        if let directionColor = self.load_Preset(_aryPresetName[sender.selectedSegmentIndex]) {
        self.chenge_colorImageViewColor(directionColor)
        }
        
        
    }
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        print(touches)
//    }


    func chenge_colorImageViewColor(directionColor:MYDirectColor){
        _CIView.up.backgroundColor = directionColor.up.chenge_UIColor()
        _CIView.down.backgroundColor = directionColor.down.chenge_UIColor()
        _CIView.stop.backgroundColor = directionColor.stop.chenge_UIColor()
        _CIView.left.backgroundColor = directionColor.left.chenge_UIColor()
        _CIView.right.backgroundColor = directionColor.right.chenge_UIColor()

    }
    
    //MARK: キーボードが出ている状態で、キーボード以外をタップしたらキーボードを閉じる
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //非表示にする。
        if(tf_segmentNames.isFirstResponder()){
            tf_segmentNames.resignFirstResponder()
        }
        
    }
    
    /*
    UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
    */
    func textFieldDidBeginEditing(textField: UITextField){
        print("textFieldDidBeginEditing:" + textField.text!)
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
//    segmentPresets.selectedSegmentIndex
//         segmentPresets.titleForSegmentAtIndex(_segmentPresetsIndexNow)  = tf_segmentNames.text
        
        print(segmentPresets.titleForSegmentAtIndex(_segmentPresetsIndexNow))
        
        segmentPresets.setTitle(textField.text, forSegmentAtIndex: _segmentPresetsIndexNow)
//        segmentPresets.titleForSegmentAtIndex(_segmentPresetsIndexNow)
        
//        segmentPresets.titleForSegmentAtIndex(_segmentPresetsIndexNow) = textField.text
        
        textField.resignFirstResponder()
        
        return true
    }

}

