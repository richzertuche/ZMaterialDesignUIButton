//
//  ZMaterialButton.h
//  
//
//  Created by Ricardo Zertuche on 7/25/15.
//
//

#import <UIKit/UIKit.h>

@class ZMaterialButton;
@protocol ZMaterialButtonDelegate <NSObject>
- (void)ZMaterialButtonDidExpandButton:(ZMaterialButton *)button withSuccces:(BOOL)success;
@end

@interface ZMaterialButton : UIButton <ZMaterialButtonDelegate>
{
    CGRect      originalFrame;
    UIImage     *originalImage;
    CGPoint     endPoint;
    
    BOOL expanded;
}

@property (nonatomic) UIImage   *changeToImage;
@property (nonatomic) UIColor   *originalParentViewColor;
@property (nonatomic) double    expandBy;

@property (retain) id delegate;


- (void)setEndAnimationPoint:(CGPoint)ePoint;


@end
