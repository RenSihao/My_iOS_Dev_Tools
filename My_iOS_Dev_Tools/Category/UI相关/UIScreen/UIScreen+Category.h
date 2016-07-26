//
//  UIScreen+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (Category)

/**
 *  当前屏幕尺寸
 *
 *  @return
 */
+ (CGSize)size;
/**
 *  当前屏幕宽度
 *
 *  @return
 */
+ (CGFloat)width;
/**
 *  当前屏幕高度
 *
 *  @return
 */
+ (CGFloat)height;
/**
 *  屏幕缩放像素 Retina 2.0 非Retina 1.0
 *
 *  @return 
 */
+ (CGFloat)scale;
/**
 *  可能旋转过的屏幕尺寸
 *
 *  @return
 */
+ (CGSize)orientationSize;
/**
 *  可能旋转过的屏幕宽度
 *
 *  @return
 */
+ (CGFloat)orientationWidth;
/**
 *  可能旋转过的屏幕高度
 *
 *  @return
 */
+ (CGFloat)orientationHeight;
/**
 *  当前屏幕分辨率尺寸
 *
 *  @return
 */
+ (CGSize)DPISize;



@end
