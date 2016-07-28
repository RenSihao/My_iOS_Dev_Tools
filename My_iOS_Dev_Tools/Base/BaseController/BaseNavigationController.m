//
//  BaseNavigationController.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController

#pragma mark - init

- (instancetype)init
{
    if (self = [super init])
    {
        //去除系统的黑线
        self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
        self.navigationController.navigationBar.translucent = NO;
        
        //NavBar的背景色
        self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
        
        //UIBarButtonItem的字体颜色
        self.navigationController.navigationBar.tintColor = [UIColor greenColor];
        
        //title
        self.navigationItem.title = @"默认导航栏的title";
        
        //为导航栏添加背景图片，图片如果是44高，那么不覆盖状态栏，如果是64高就会覆盖状态栏
        //UIBarMetricsDefault 缺省值 UIBarMetricsCompact 横屏样式  UIBarMetricsDefaultPrompt和UIBarMetricsCompactPrompt是有promt的两种样式
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"m_nav64"] forBarMetrics:UIBarMetricsDefault];
        
        //定制返回按钮,这两个要一起用,为啥这么用，苹果言语不详
//        self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"m_ios"];
//        self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"m_ios"];
        
        //修改导航栏标题的字体
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowColor = [UIColor redColor];
        shadow.shadowOffset = CGSizeMake(0, 1);
        
        //字典中放入你想修改的键值对,原来的UITextAttributeFont、UITextAttributeTextColor、UITextAttributeTextShadowColor、UITextAttributeTextShadowOffset已弃用
        self.navigationController.navigationBar.titleTextAttributes = @{
                                                                        NSForegroundColorAttributeName:[UIColor orangeColor],
                                                                        NSShadowAttributeName:shadow,
                                                                        NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0]
                                                                        };
        
        //导航栏toolBar隐藏开关
        self.navigationController.toolbarHidden = YES;
    }
    return self;
}
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController])
    {
        
    }
    return self;
}

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    
}



















@end
