//
//  ViewController.swift
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/1/3.
//  Copyright © 2017年 ZF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = ZFButtonToll.createButton(withSuperView: self.view, frame: CGRect.init(x: 100, y: 100, width: 200, height: 200), title: "haha", tag: 1003, buttonType: ZFButtonType_custom)
        btn?.addTarget(self, action: #selector(ViewController.clickBtn(sender:)), for: UIControlEvents.touchUpInside)
        
//        ZFButtonToll.createButton(withSuperView: self.view, frame: CGRect.init(x: 100, y: 200, width: 200, height: 200), title: "hehe", tag: 1005, buttonType: ZFButtonType_custom, actionHandler: ButtonClickBlock)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func clickBtn(sender:UIButton){
        
        NSLog("%d", sender.tag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

