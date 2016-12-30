//
//  UIViewController+Frame.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/14.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UIViewController+Frame.h"

@implementation UIViewController (Frame)

- (CGFloat)statusBarHeight
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

- (CGFloat)navigationBarHeight
{
    if (self.navigationController.isNavigationBarHidden){
        return 0;
    } else {
        return BaseNavBarHeight;
    }
}
- (CGFloat)tabBarHeight
{
    if (self.tabBarController.tabBar.isHidden) {
        return 0;
    } else {
        return BaseTabBarHeight;
    }
}
- (CGFloat)contentHeight
{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return screenHeight - self.statusBarHeight - self.navigationBarHeight - self.tabBarHeight;
}
- (CGFloat)contentWidth
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    return screenWidth;
}

@end
