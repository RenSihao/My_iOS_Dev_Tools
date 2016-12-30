//
//  BaseTabBarController.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "FourthVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBarController ()

@property (nonatomic, strong) BaseNavigationController *firstVC;
@property (nonatomic, strong) BaseNavigationController *secondVC;
@property (nonatomic, strong) BaseNavigationController *thirdVC;
@property (nonatomic, strong) BaseNavigationController *fourthVC;

@property (nonatomic, strong) NSArray *tabBarItemsAttributesForController;
@property (nonatomic, strong) NSArray *childVCs;
@end


@implementation BaseTabBarController

#pragma mark - init
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static BaseTabBarController *tabBarController = nil;
    dispatch_once(&onceToken, ^{
        tabBarController = [[self alloc] init];
        [tabBarController congfigure];
    });
    return tabBarController;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 初始化基本属性

- (void)congfigure
{
    // 配置Tabbar
    self.tabBarItemsAttributes = self.tabBarItemsAttributesForController;
    
    // 配置子控制器
    self.viewControllers = self.childVCs;
    
    // 配置Tabbar Appearance属性
    [self customTabBarAppearance];
}
// 自定义 Tabbar Appearance
- (void)customTabBarAppearance
{
    // 自定义 TabBar 高度
    self.tabBarHeight = 49.f;
    
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
 
}
// 支持横竖屏
- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate
{
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}
// TabBarItem选中后的背景颜色
- (void)customizeTabBarSelectionIndicatorImage
{
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    UITabBarController *tabBarController = [self cyl_tabBarController] ?: [[UITabBarController alloc] init];
    CGFloat tabBarHeight = tabBarController.tabBar.frame.size.height;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor redColor]
                             size:selectionIndicatorImageSize]];
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - lazy load

- (NSArray *)tabBarItemsAttributesForController
{
    if (!_tabBarItemsAttributesForController) {
        NSDictionary *firstTabBarItemsAttributes = @{
                                                     CYLTabBarItemTitle : @"First",
                                                     CYLTabBarItemImage : @"tabbar_first_normal",
                                                     CYLTabBarItemSelectedImage : @"tabbar_first_highlighted",
                                                     };
        NSDictionary *secondTabBarItemsAttributes = @{
                                                      CYLTabBarItemTitle : @"second",
                                                      CYLTabBarItemImage : @"tabbar_second_normal",
                                                      CYLTabBarItemSelectedImage : @"tabbar_second_highlighted",
                                                      };
        NSDictionary *thirdTabBarItemsAttributes = @{
                                                     CYLTabBarItemTitle : @"third",
                                                     CYLTabBarItemImage : @"tabbar_third_normal",
                                                     CYLTabBarItemSelectedImage : @"tabbar_third_highlighted",
                                                     };
        NSDictionary *fourthTabBarItemsAttributes = @{
                                                      CYLTabBarItemTitle : @"fourth",
                                                      CYLTabBarItemImage : @"tabbar_fourth_normal",
                                                      CYLTabBarItemSelectedImage : @"tabbar_fourth_highlighted"
                                                      };
        _tabBarItemsAttributesForController = @[
                                                firstTabBarItemsAttributes,
                                                secondTabBarItemsAttributes,
                                                thirdTabBarItemsAttributes,
                                                fourthTabBarItemsAttributes
                                                ];
    }
    return _tabBarItemsAttributesForController;
    
    
}
- (NSArray *)childVCs
{
    if (!_childVCs) {
        _childVCs = @[self.firstVC,
                      self.secondVC,
                      self.thirdVC,
                      self.fourthVC];
    }
    return _childVCs;
}
- (BaseNavigationController *)firstVC
{
    if (!_firstVC) {
        _firstVC = [[BaseNavigationController alloc] initWithRootViewController:[FirstVC new]];
    }
    return _firstVC;
}
- (BaseNavigationController *)secondVC
{
    if (!_secondVC) {
        _secondVC = [[BaseNavigationController alloc] initWithRootViewController:[SecondVC new]];
    }
    return _secondVC;
}
- (BaseNavigationController *)thirdVC
{
    if (!_thirdVC) {
        _thirdVC = [[BaseNavigationController alloc] initWithRootViewController:[ThirdVC new]];
    }
    return _thirdVC;
}
- (BaseNavigationController *)fourthVC
{
    if (!_fourthVC) {
        _fourthVC = [[BaseNavigationController alloc] initWithRootViewController:[FourthVC new]];
    }
    return _fourthVC;
}

@end

NS_ASSUME_NONNULL_END
