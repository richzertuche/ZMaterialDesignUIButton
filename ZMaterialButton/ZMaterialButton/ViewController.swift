//
//  ViewController.swift
//  ZMaterialButton
//
//  Created by Ricardo Zertuche on 2/16/15.
//  Copyright (c) 2015 Ricardo Zertuche. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ZMaterialButtonDelegate {

    var button: ZMaterialButton!
    var fButton: UIButton!
    var bButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let containerView = UIView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height-200))
        containerView.clipsToBounds = true
        self.view.addSubview(containerView)
        
        self.button = ZMaterialButton(frame: CGRect(x: 10, y: 40, width: 50, height: 50))
        self.button.setImage(UIImage(named: "play"), forState: UIControlState.Normal)
        self.button.backgroundColor = UIColor(red:0.05, green:0.69, blue:0.79, alpha:1)
        self.button.endPoint = CGPoint(x:self.view.center.x-25, y: self.view.center.y-25)
        self.button.changeToImage = UIImage(named: "pause")
        self.button.expandBy = 15
        self.button.Zdelegate = self
        containerView.addSubview(self.button)
        
        self.fButton = UIButton(frame: CGRect(x: self.view.center.x+30, y: self.view.center.y-50, width: 100, height: 100))
        self.fButton.setImage(UIImage(named: "forward"), forState: UIControlState.Normal)
        containerView.addSubview(self.fButton)
        self.fButton.layer.zPosition = 9999
        self.fButton.alpha = 0
        
        self.bButton = UIButton(frame: CGRect(x: self.view.center.x-130, y: self.view.center.y-50, width: 100, height: 100))
        self.bButton.setImage(UIImage(named: "forward"), forState: UIControlState.Normal)
        self.bButton.transform = CGAffineTransformMakeRotation(3.1416);
        containerView.addSubview(self.bButton)
        self.fButton.layer.zPosition = 9999
        self.bButton.alpha = 0
    
    }
    
    func ZMaterialButtonDidExpand(button: ZMaterialButton, expanded: Bool){
        if expanded == true {
            self.testButtonExpanded()
            UIView.animateWithDuration(0.1, delay: 0, options: .CurveEaseOut, animations: {
                self.fButton.alpha = 1
                self.bButton.alpha = 1
                }, completion:nil)
        }
        else {
            self.testButtonReduced()
            UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseOut, animations: {
                self.fButton.alpha = 0
                self.bButton.alpha = 0
                }, completion:nil)
        }
    }
    
    func testButtonExpanded(){
        print("Expanded and Action")
    }
    
    func testButtonReduced(){
        print("Reduced and Action")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

