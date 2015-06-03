//
//  IntroViewController.m
//  DQIntroView
//
//  Created by DQ_Yang on 15/5/27.
//  Copyright (c) 2015年 DQ_Yang. All rights reserved.
//

#pragma mark - 屏幕尺寸
//设备全屏尺寸
#define ZRFullScreenSize        [UIScreen mainScreen].bounds.size
//设备全屏宽度
#define ZRFullScreenWidth       [UIScreen mainScreen].bounds.size.width
//设备全屏高度
#define ZRFullScreenHight       [UIScreen mainScreen].bounds.size.height
//应用程序高度
#define ZRAppFrameHeight        [UIScreen mainScreen].applicationFrame.size.height

#import "IntroViewController.h"

@interface IntroViewController () <UIScrollViewDelegate>

@property (strong, nonatomic)  UIScrollView *scrollView;
@property (strong, nonatomic)  UIPageControl *pageControl;
@property UIView *holeView;
@property UIView *circleView;
@property UIButton *doneButton;

@end

@implementation IntroViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = [UIImage imageNamed:@"intro1_back"];
    [self.view addSubview:backgroundImageView];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height*.95, self.view.frame.size.width, 10)];
    self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000];
    self.pageControl.userInteractionEnabled = NO;
//    self.pageControl.hidden = YES;
    [self.view addSubview:self.pageControl];
    
    [self createViewOne];
    [self createViewTwo];
    [self createViewThree];
    [self createViewFour];
    
    
    //Done Button
    self.doneButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width*.1, self.view.frame.size.height*.85, self.view.frame.size.width*.8, 40)];
    [self.doneButton setTintColor:[UIColor whiteColor]];
    [self.doneButton setTitle:@"立即体验" forState:UIControlStateNormal];
    [self.doneButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0]];
    self.doneButton.backgroundColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000];
    self.doneButton.layer.borderColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000].CGColor;
    [self.doneButton addTarget:self action:@selector(enter:) forControlEvents:UIControlEventTouchUpInside];
    self.doneButton.layer.borderWidth =.5;
    self.doneButton.layer.cornerRadius = 15;
    [self.view addSubview:self.doneButton];
    self.doneButton.alpha = 0;
    
    
    self.pageControl.numberOfPages = 4;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*4, self.scrollView.frame.size.height);
    
    //This is the starting point of the ScrollView
    CGPoint scrollPoint = CGPointMake(0, 0);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = CGRectGetWidth(self.view.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    self.pageControl.currentPage = roundf(pageFraction);
    if (self.pageControl.currentPage == 3) {
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.doneButton.alpha = 1;
        } completion:^(BOOL finished) {
            self.doneButton.alpha = 1 ;
        }];
    }else
    {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.doneButton.alpha = 0;
        } completion:^(BOOL finished) {
            self.doneButton.alpha = 0;
        }];
    }
    
}

-(void)createViewOne{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ZRFullScreenWidth, ZRFullScreenHight)];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:view.frame];
    imageview.contentMode = UIViewContentModeScaleAspectFit;

    [view addSubview:imageview];
    
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
    
}

-(void)createViewTwo{
    
    CGFloat originWidth = ZRFullScreenWidth;
    CGFloat originHeight = ZRFullScreenHight;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(ZRFullScreenWidth, 0, originWidth, originHeight)];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageview.contentMode = UIViewContentModeScaleAspectFit;

    [view addSubview:imageview];
    
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
    
}

-(void)createViewThree{
    
    CGFloat originWidth = ZRFullScreenWidth;
    CGFloat originHeight = ZRFullScreenHight;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(ZRFullScreenWidth*2, 0, originWidth, originHeight)];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.contentMode = UIViewContentModeScaleAspectFit;

    [view addSubview:imageview];
    
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
    
}

-(void)createViewFour{
    
    CGFloat originWidth = ZRFullScreenWidth;
    CGFloat originHeight = ZRFullScreenHight;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(ZRFullScreenWidth*3, 0, originWidth, originHeight)];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.contentMode = UIViewContentModeScaleAspectFit;

    [view addSubview:imageview];
    
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
    
}

#pragma mark - Action

- (void)enter:(id)object
{
    self.didSelectedEnter();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
