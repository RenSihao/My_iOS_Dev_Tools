//
//  UINavigationController+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UINavigationController+Category.h"

@implementation UINavigationController (Category)

- (void)removeViewController:(UIViewController*)controller
{
    NSMutableArray *array = [self.viewControllers mutableCopy];
    [array removeObject:controller];
    [self setViewControllers:array];
}

- (void)setTintColor:(UIColor*)tintColor
{
    [self.navigationBar setTintColor:tintColor];
}

- (void)setBackgroudImage:(UIImage *)image
{

    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

@end
