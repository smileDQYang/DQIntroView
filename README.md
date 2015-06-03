# DQIntroView

#import "IntroViewController.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor grayColor];
    
    [_window makeKeyAndVisible];
    
    self.introView = [[IntroViewController alloc] init];
    
    [self.window addSubview:self.introView.view];
    
    __weak AppDelegate *weakSelf = self;
    
    self.introView.didSelectedEnter = ^() {
        
        [weakSelf.introView.view removeFromSuperview];
        
        weakSelf.introView = nil;
        
        // 进入主控制器
        //  ViewController *mainVC = [[ViewController alloc] init];
        //  weakSelf.window.rootViewController = mainVC;
    };

    return YES;
}

引导页每页可以自定义布局，更多请参照demo；

新手~so，你懂得
