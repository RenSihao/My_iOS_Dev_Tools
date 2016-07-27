//
//  UINavigationController+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Category)

- (void)setBackgroudImage:(UIImage*)image;
- (void)setTintColor:(UIColor*)tintColor;
- (void)removeViewController:(UIViewController*)controller;

@end
