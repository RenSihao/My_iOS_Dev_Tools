//
//  AppDelegate+Appearance.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "AppDelegate+Appearance.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <YYKit/UIImage+YYAdd.h>

@implementation AppDelegate (Appearance)

/**
 *  此处配置全局Appearance
 */
- (BOOL)appearance_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // TabBar Appearance
    [self setUpTabBar];
    
    // NavigationBar Appearance
    [self setUpNavigationBar];
    
    // SVP
    [self setUpSVP];
    
    //...
    
    return YES;
}

#pragma mark - TabBar

- (void)setUpTabBar
{
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = AppHexColor(@"9B9B9B");
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = AppHexColor(@"4A90E2");
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 设置背景图片
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    // 去除 TabBar 自带的顶部阴影
    //[[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}
- (void)setUpNavigationBar
{
    UINavigationBar *navBarAppearance = [UINavigationBar appearance];
    UIBarButtonItem *barItemAppearance = [UIBarButtonItem appearance];
    
    // 很奇怪：此处如果是 UIBarStyleDefault 则设置状态栏颜色的时候会不起作用
    navBarAppearance.barStyle = UIBarStyleBlack;
    
    // 去除系统的黑线
    navBarAppearance.shadowImage = [[UIImage alloc] init];
    
    // translucent 为YES 模糊效果 坐标零点默认在（0，0）点
    // translucent 为NO 彻底不透明 坐标零点默认在（0，64）点
    navBarAppearance.translucent = NO;
    
    // NavBar的背景色 iOS7及其以上
    navBarAppearance.barTintColor = AppHexColor(@"4a4a4a");
    
    // 为导航栏添加背景图片，图片如果是44高，那么不覆盖状态栏，如果是64高就会覆盖状态栏
    // UIBarMetricsDefault 缺省值 UIBarMetricsCompact 横屏样式  UIBarMetricsDefaultPrompt和UIBarMetricsCompactPrompt是有promt的两种样式
    //[navBarAppearance setBackgroundImage:[UIImage imageNamed:@"m_nav64"] forBarMetrics:UIBarMetricsDefault];
    
    // UIBarButtonItem的字体颜色
    navBarAppearance.tintColor = AppHexColor(@"ffffff");
    
    
    // 修改导航栏标题的字体、颜色、大小、阴影效果
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor whiteColor];
    shadow.shadowOffset = CGSizeMake(0, 1);
    navBarAppearance.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                             NSShadowAttributeName:shadow,
                                             NSFontAttributeName:[UIFont systemFontOfSize:21]
                                             };
    
    // 定制返回按钮,这两个要一起用,为啥这么用，苹果言语不详
    navBarAppearance.backIndicatorImage = [UIImage imageNamed:@"nav_back"];
    navBarAppearance.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"nav_back"];
    
    // 原生返回按钮旁边的字 使其偏移出屏幕
    [barItemAppearance setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
}
- (void)setUpSVP
{
    // 黑色背景 白色圆环和文字
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    // 允许用户操作
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    
    // 加载指示器风格（0：SVP自带 1：iOS原生）
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    
    // 最小尺寸
    [SVProgressHUD setMinimumSize:CGSizeMake([UIScreen mainScreen].bounds.size.width*0.5,
                                             [UIScreen mainScreen].bounds.size.width*0.25)];
    
    // 加载指示器线宽度
    [SVProgressHUD setRingThickness:2];
    
    // 加载指示器圆圈半径
    [SVProgressHUD setRingRadius:18];
    
    // 加载指示器无文字半径
    [SVProgressHUD setRingNoTextRadius:24];
    
    // 圆角尺寸
    [SVProgressHUD setCornerRadius:14];
    
    // 字体
    [SVProgressHUD setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]];
    
    // 前景色 only used for SVProgressHUDStyleCustom
    [SVProgressHUD setForegroundColor:[UIColor blackColor]];
    
    // 背景色 only used for SVProgressHUDStyleCustom
    [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
    
    // 背景透明度 only used for SVProgressHUDMaskTypeBlack
    [SVProgressHUD setBackgroundLayerColor:[UIColor colorWithWhite:0 alpha:0.5]];
    
    // 28*28
//    [SVProgressHUD setInfoImage:[UIImage imageNamed:@""]];
    
    UIImage *success = [UIImage imageNamed:@"svp_success"];
    
    [SVProgressHUD setSuccessImage:success];
    
//    [SVProgressHUD setErrorImage:[UIImage imageNamed:@""]];
    
    // 最短消失时间
    [SVProgressHUD setMinimumDismissTimeInterval:5.f];
    
    // 淡入效果时间
    [SVProgressHUD setFadeInAnimationDuration:0.5];
    
    // 淡出效果时间
    [SVProgressHUD setFadeOutAnimationDuration:0.5];
    
    // 支持window层级 （iOSwindow层级优先级从高到底：Normal < StatusBar < Alert）
    [SVProgressHUD setMaxSupportedWindowLevel:UIWindowLevelNormal];
    
//     default is nil, only used if #define SV_APP_EXTENSIONS is set
//    + (void)setViewForExtension:(UIView*)view;
}



@end
