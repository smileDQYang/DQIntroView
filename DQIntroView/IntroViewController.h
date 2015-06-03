//
//  IntroViewController.h
//  DQIntroView
//
//  Created by DQ_Yang on 15/5/27.
//  Copyright (c) 2015年 DQ_Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DidSelectedEnter)();

@interface IntroViewController : UIViewController

@property (nonatomic, strong) UIButton *enterButton;

@property (nonatomic, copy) DidSelectedEnter didSelectedEnter;

@end
