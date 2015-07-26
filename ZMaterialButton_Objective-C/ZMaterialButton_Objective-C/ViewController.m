//
//  ViewController.m
//  ZMaterialButton_Objective-C
//
//  Created by Ricardo Zertuche on 7/25/15.
//  Copyright (c) 2015 Ricardo Zertuche. All rights reserved.
//

#import "ViewController.h"
#import "ZMaterialButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZMaterialButton *ZButton = [[ZMaterialButton alloc]initWithFrame:CGRectMake(40, 40, 50, 50)];
    [ZButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [ZButton setBackgroundColor:[UIColor redColor]];
    [ZButton setEndAnimationPoint:CGPointMake(self.view.center.x-25, self.view.center.y-25)];
    ZButton.changeToImage = [UIImage imageNamed:@"pause"];
    ZButton.expandBy = 20;
    ZButton.originalParentViewColor = [UIColor whiteColor];
    ZButton.delegate = self;
    
    [self.view addSubview:ZButton];
}

- (void) ZMaterialButtonDidExpandButton:(ZMaterialButton *)button withSuccces:(BOOL)success{
    if (success) {
        NSLog(@"Expanded");
    } else {
        NSLog(@"Reduced");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
