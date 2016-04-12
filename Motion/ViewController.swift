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

var _aryColorImageView = [ColorImageView]()

var _scrollView_Presets = UIScrollView()

class ViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var segmentPresets: UISegmentedControl!
    
    @IBOutlet weak var buttonAdd: UIButton!
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
        
        let redColor = MYColor()
        redColor.set_RedColor()
        
        
        //-------------
        
        let directColor = MYDirectColor()
        
        directColor.chenge_LeftColor(redColor)
        directColor.chenge_RightColor(redColor)
        //
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "0")
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "1")
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "2")
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "3")
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "4")
        _ud.setObject(directColor.chenge_Dictionary(), forKey: "5")
        
//       _CIView = _colorImageView
        
//        self.view.addSubview(_CIView.baseView)
        
        self.iv_SetColor()
        
        let scrViewRect = CGRect(origin: CGPointZero, size: CGSize(width: self.view.frame.width, height: 100))
        
        _scrollView_Presets = UIScrollView(frame: scrViewRect)
        _scrollView_Presets.center = self.view.center
        _scrollView_Presets.contentSize = CGSize(width: 100, height: 130)
        _scrollView_Presets.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(_scrollView_Presets)
        
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
        
        //同じ名前のキーがあった場合は削除する
        if let _ =  _ud.objectForKey(name){
         _ud.removeObjectForKey(name)
        }
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
    
    
    func animation(civ:ColorImageView){
        UIView.animateWithDuration(1,
            animations:
            {() -> Void in
                civ.baseView.center = CGPoint(
                    x: civ.baseView.center.x - (90 * CGFloat(_aryColorImageView.count)),
                    y: civ.baseView.center.y)
                print("ary = \(_aryColorImageView.count) x = \(civ.baseView.center.x)")

            
            }
        )
    }
    
//MARK: - IBAction
    
    @IBAction func action_AddButton(sender: UIButton) {
       
        //新規作成
        func make(){
            let _colorImageView = ColorImageView.init(color: UIColor.blackColor())
            
            
            _scrollView_Presets.addSubview(_colorImageView.baseView)
            _colorImageView.baseView.center = _scrollView_Presets.center
//            self.view.addSubview(_colorImageView.baseView)
//            _colorImageView.baseView.center = self.view.center
            
            _aryColorImageView.append(_colorImageView)
            
        }


        if  _aryColorImageView.count > 0 {
            
            let count = _aryColorImageView.count - 1
            print("count = \(count)")
            
            for i in 0...count {
                let civ = _aryColorImageView[i] as ColorImageView
                self.animation(civ)
                
            }
        
        }
        make()
//        print(_aryColorImageView.count)
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
        
        print(segmentPresets.titleForSegmentAtIndex(_segmentPresetsIndexNow))
        
        segmentPresets.setTitle(textField.text, forSegmentAtIndex: _segmentPresetsIndexNow)
        
        textField.resignFirstResponder()
        
        return true
    }

}

