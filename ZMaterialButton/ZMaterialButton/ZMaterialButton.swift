//
//  ZMaterialButton.swift
//  ZMaterialButton
//
//  Created by Ricardo Zertuche on 2/16/15.
//  Copyright (c) 2015 Ricardo Zertuche. All rights reserved.
//

import UIKit

@objc protocol ZMaterialButtonDelegate {
    func ZMaterialButtonDidExpand(button: ZMaterialButton, expanded: Bool)
}

class ZMaterialButton: UIButton {
    
    var endPoint:CGPoint!
    var changeToImage:UIImage!
    var expandBy:CGFloat = 9.0
    
    private var originalFrame:CGRect!
    private var originalImage: UIImage!
    private var originalColor: UIColor!
    
    var Zdelegate: ZMaterialButtonDelegate?
    
    var expanded: Bool!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layer.cornerRadius = frame.width/2
        super.imageView?.contentMode = UIViewContentMode.Center
        self.expanded = false
        self.originalFrame = frame
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        if self.expanded == true {
            self.buttonReduce()
        }
        else {
            self.buttonMove()
        }
    }
    
    func setEndPont(point: CGPoint){
        endPoint = point
    }
    
    private func buttonMove(){
        self.originalColor = self.superview!.backgroundColor
        self.originalImage = self.imageView?.image
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut, animations: {
            self.frame = CGRect(x: self.endPoint.x, y: self.endPoint.y, width: self.frame.width, height: self.frame.height)
            }, completion:{
                finished in
                self.buttonExpand()
            })
    }
    
    private func buttonExpand(){
        
        let parentView: UIView = self.superview!
        
        self.imageView!.alpha = 0
        let dummyImageView = UIImageView(frame: self.frame)
        dummyImageView.image = self.originalImage
        dummyImageView.contentMode = UIViewContentMode.Center
        parentView.addSubview(dummyImageView)
        
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut, animations: {
            self.transform = CGAffineTransformMakeScale(self.expandBy,self.expandBy)
            
            }, completion:{
                finished in
                self.transform = CGAffineTransformMakeScale(1.0,1.0)
                self.imageView!.alpha = 1
                self.imageView?.image = self.changeToImage
                parentView.backgroundColor = self.backgroundColor
                dummyImageView.removeFromSuperview()
                self.expanded = true
                self.Zdelegate?.ZMaterialButtonDidExpand(self, expanded: self.expanded)
        })
    }
    
    private func buttonReduce(){
        let parentView: UIView = self.superview!
        
        let dummyImageView = UIImageView(frame: self.frame)
        dummyImageView.image = self.changeToImage
        dummyImageView.contentMode = UIViewContentMode.Center
        parentView.addSubview(dummyImageView)
        
        self.alpha = 0
        self.imageView!.alpha = 0;
        self.transform = CGAffineTransformMakeScale(self.expandBy,self.expandBy)
        parentView.backgroundColor = originalColor
        self.alpha = 1
        
        self.expanded = false
        self.Zdelegate?.ZMaterialButtonDidExpand(self, expanded: self.expanded)
        
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut, animations: {
            self.transform = CGAffineTransformMakeScale(1,1)
            
            }, completion:{
                finished in
                self.imageView!.alpha = 1;
                self.imageView?.image = self.originalImage
                dummyImageView.removeFromSuperview()
                self.buttonGetBack()
        })
    }
    
    private func buttonGetBack(){
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .CurveEaseOut, animations: {
            self.frame = self.originalFrame
            }, completion:nil)
    }
}
