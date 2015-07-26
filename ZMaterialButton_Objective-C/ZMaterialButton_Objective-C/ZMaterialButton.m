//
//  ZMaterialButton.m
//  
//
//  Created by Ricardo Zertuche on 7/25/15.
//
//

#import "ZMaterialButton.h"

@implementation ZMaterialButton

- (ZMaterialButton*)initWithFrame:(CGRect)frame{
    self                        = [super initWithFrame:frame];
    self.layer.cornerRadius     = frame.size.width/2;
    self.imageView.contentMode  = UIViewContentModeCenter;
    
    expanded                    = false;
    originalFrame               = frame;
    originalImage               = self.imageView.image;
    self.expandBy               = 9.0;
    self.delegate               = self;
    
    
    return self;
}

- (void)setEndAnimationPoint:(CGPoint)ePoint{
    endPoint = ePoint;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (!expanded) {
        [self buttonMove];
    } else {
        [self buttonReduce];
    }
}

- (void)buttonMove{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame = CGRectMake(endPoint.x, endPoint.y, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished){
        [self buttonExpand];
    }];
}

- (void)buttonExpand{
    self.imageView.alpha            =   0;
    
    UIImageView *dummyImageView     = [[UIImageView alloc]initWithFrame:self.superview.frame];
    [dummyImageView setImage:self.changeToImage];
    [dummyImageView setContentMode:UIViewContentModeCenter];
    [self.superview addSubview:dummyImageView];
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.transform = CGAffineTransformMakeScale(self.expandBy,self.expandBy);
    } completion:^(BOOL finished){
        expanded            =   true;
        self.transform = CGAffineTransformMakeScale(1.0,1.0);
        self.imageView.image = self.changeToImage;
        self.imageView.alpha = 1;
        self.superview.backgroundColor = self.backgroundColor;
        [dummyImageView removeFromSuperview];
        [self.delegate ZMaterialButtonDidExpandButton:self withSuccces:true];
    }];
}

- (void)buttonReduce{
    self.imageView.alpha            =   0;
    self.transform = CGAffineTransformMakeScale(self.expandBy,self.expandBy);
    self.superview.backgroundColor = self.originalParentViewColor;
    
    UIView      *dummyView          =   self.superview;
    UIImageView *dummyImageView     = [[UIImageView alloc]initWithFrame:dummyView.frame];
    [dummyImageView setImage:self.changeToImage];
    [dummyImageView setContentMode:UIViewContentModeCenter];
    [dummyView addSubview:dummyImageView];
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.transform = CGAffineTransformMakeScale(1,1);
    } completion:^(BOOL finished){
        expanded            =   false;
        self.imageView.image = originalImage;
        self.imageView.alpha = 1;
        [dummyImageView removeFromSuperview];
        [self buttonGetBack];
    }];
}

- (void)buttonGetBack{
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame = originalFrame;
    } completion:^(BOOL finished){
        [self.delegate ZMaterialButtonDidExpandButton:self withSuccces:false];
    }];
}

@end
