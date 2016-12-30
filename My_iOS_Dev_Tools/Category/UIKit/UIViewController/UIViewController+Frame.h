//
//  UIViewController+Frame.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/14.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Frame)

/**
 *  获取状态栏高度
 *
 *  @return
 */
- (CGFloat)statusBarHeight;

/**
 *  获取NavigationBar高度
 *
 *  @return
 */
- (CGFloat)navigationBarHeight;

/**
 *  获取TabBar高度
 *
 *  @return
 */
- (CGFloat)tabBarHeight;

/**
 *  获取可显示内容高度
 *
 *  @return
 */
- (CGFloat)contentHeight;

/**
 *  获取可显示内容宽度，默认就是屏幕宽度
 */
- (CGFloat)contentWidth;

@end
